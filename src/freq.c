/*
 * Frequency and digital sensor inputs.
 *   FREQ1..FREQ4 = PA15, PB3, PB10, PB11 (TIM2 CH1..CH4, 32 bit)     FREQ5 = PA8 (TIM1 CH1, 16 bit extended by software)
 * Both timers count at 4 MHz (0.25 us). Every edge is time stamped by input capture.
 *
 * Decoders:
 *   - period / duty / pulse counter / flex fuel (frequency = ethanol, low pulse width = fuel temperature)
 *   - Hella oil level + temperature (PULS): ported from rusEFI hella_oil_level.cpp
 *   - SENT (SAE J2716) fast channels
 *   - Hella pressure + temperature (PWM): EXPERIMENTAL, written from the public description of the frame
 *     (three 1024 us pulses: diagnostic, temperature, pressure). Needs checking against a real sensor.
 */
#include "canio.h"

#define TICKS_PER_US 4U
#define TIMER_HZ     4000000.0f

typedef struct {
  ioportid_t port; uint8_t pad;
  volatile uint32_t lastRise, lastFall, lastAny;
  volatile uint32_t period, high, low, count, lastEdgeMs;
  volatile bool haveRise, haveFall, haveAny;
  uint8_t mode, edge;
  uint32_t minTicks;
  /* SENT */
  float sentNominal, sentTick;
  uint8_t nib[8], nibIdx;
  bool sentSync;
  volatile uint16_t sig0, sig1;
  volatile uint32_t sentOkMs;
  /* Hella pressure + temperature */
  volatile uint32_t hpHigh[3];
  uint8_t hpPhase, hpScore[3];
  /* Hella oil level */
  uint8_t hlNext;
  volatile float hlTemp, hlLevel;
  volatile uint32_t hlOkMs;
} fq_t;

static fq_t fq[N_FQ] = {
  { .port = GPIOA, .pad = 15 }, { .port = GPIOB, .pad = 3 }, { .port = GPIOB, .pad = 10 }, { .port = GPIOB, .pad = 11 }, { .port = GPIOA, .pad = 8 },
};
static volatile uint32_t tim1Overflows;

static const uint8_t crc4tab[16] = { 0, 13, 7, 10, 14, 3, 9, 4, 1, 12, 6, 11, 15, 2, 8, 5 };

/* SENT decoder, called with the time between two falling edges. */
static void sent_edge(fq_t *f, uint32_t interval, uint32_t nowMs) {
  float iv = (float)interval;
  if (iv > f->sentNominal * 56.0f * 0.8f && iv < f->sentNominal * 56.0f * 1.2f) {
    f->sentTick = iv / 56.0f;            /* calibration pulse: 56 ticks */
    f->nibIdx = 0;
    f->sentSync = true;
    return;
  }
  if (!f->sentSync) return;
  int n = (int)(iv / f->sentTick + 0.5f) - 12;
  if (n < 0 || n > 15) { f->sentSync = false; return; }
  f->nib[f->nibIdx++] = (uint8_t)n;
  if (f->nibIdx == 8) {                  /* status, 6 data nibbles, CRC */
    uint8_t c = 5;
    for (int i = 1; i <= 6; i++) c = (uint8_t)(crc4tab[c] ^ f->nib[i]);
    uint8_t recommended = crc4tab[c];    /* newer sensors add a final zero nibble */
    if (f->nib[7] == c || f->nib[7] == recommended) {
      f->sig0 = (uint16_t)((f->nib[1] << 8) | (f->nib[2] << 4) | f->nib[3]);
      f->sig1 = (uint16_t)((f->nib[6] << 8) | (f->nib[5] << 4) | f->nib[4]);
      f->sentOkMs = nowMs;
    }
    f->sentSync = false;                 /* wait for the next calibration pulse (also skips the pause pulse) */
  }
}

static bool near_us(uint32_t us, uint32_t target) {
  uint32_t d = us > target ? us - target : target - us;
  return d < 32;
}

/* Called from the capture interrupts for every edge: ts is the timer count, level the pin state after the edge. */
static void on_edge(int ch, uint32_t ts, bool level) {
  fq_t *f = &fq[ch];
  uint32_t nowMs = now_ms();
  if (f->mode == 0) return;

  if (f->mode == 9) {                    /* SENT: falling edges only */
    if (f->haveFall) sent_edge(f, ts - f->lastFall, nowMs);
    f->lastFall = ts; f->haveFall = true; f->lastEdgeMs = nowMs;
    return;
  }
  if (f->haveAny && (ts - f->lastAny) < f->minTicks) return;      /* noise */

  if (f->mode == 8) {                    /* Hella oil level, see rusEFI HellaOilLevelSensor::onEdge */
    if (level) {
      float gap = f->haveRise ? (float)(ts - f->lastRise) / TIMER_HZ : 10.0f;
      if (gap > 0.89f * 0.780f && gap < 1.11f * 0.780f) f->hlNext = 1;                 /* long break: next is temperature */
      else if (gap > 0.89f * 0.110f && gap < 1.11f * 0.110f) f->hlNext = (f->hlNext == 1) ? 2 : (f->hlNext == 2) ? 3 : 0;
      else f->hlNext = 0;
    } else if (f->haveRise) {
      float ms = (float)(ts - f->lastRise) * 1000.0f / TIMER_HZ;
      if (ms > 100.0f || ms < 20.0f) f->hlNext = 0;
      else if (f->hlNext == 1) {
        if (ms >= 22.8f && ms <= 87.2f) f->hlTemp = interp(23.0f, -40.0f, 87.0f, 160.0f, ms);
      } else if (f->hlNext == 2) {
        if (ms >= 22.8f) { f->hlLevel = interp(23.0f, 0.0f, 87.86f, 150.0f, ms); f->hlOkMs = nowMs; }
      }
    }
  } else if (f->mode == 7) {             /* Hella pressure + temperature */
    if (!level && f->haveRise) {
      uint32_t us = (ts - f->lastRise) / TICKS_PER_US;
      f->hpPhase = (uint8_t)((f->hpPhase + 1) % 3);
      f->hpHigh[f->hpPhase] = us;
      bool diag = near_us(us, 256) || near_us(us, 384) || near_us(us, 512) || near_us(us, 640);
      f->hpScore[f->hpPhase] = diag ? (uint8_t)(f->hpScore[f->hpPhase] < 20 ? f->hpScore[f->hpPhase] + 1 : 20) : 0;
    }
  }

  /* generic timing, used by the plain modes and for the live frequency display of the others */
  bool both = f->edge == 2;
  if (level) {
    if (f->haveRise && f->edge == 0) { f->period = ts - f->lastRise; f->count++; }
    if (f->haveFall) f->low = ts - f->lastFall;
    f->lastRise = ts; f->haveRise = true;
  } else {
    if (f->haveFall && f->edge == 1) { f->period = ts - f->lastFall; f->count++; }
    if (f->haveRise) f->high = ts - f->lastRise;
    f->lastFall = ts; f->haveFall = true;
  }
  if (both) {
    if (f->haveAny) f->period = (ts - f->lastAny) * 2U;
    f->count++;
  }
  f->lastAny = ts; f->haveAny = true;
  f->lastEdgeMs = nowMs;
}

OSAL_IRQ_HANDLER(STM32_TIM2_HANDLER) {
  OSAL_IRQ_PROLOGUE();
  uint32_t sr = TIM2->SR & TIM2->DIER;
  TIM2->SR = ~sr;
  if (sr & TIM_SR_CC1IF) on_edge(0, TIM2->CCR1, palReadPad(GPIOA, 15) != 0);
  if (sr & TIM_SR_CC2IF) on_edge(1, TIM2->CCR2, palReadPad(GPIOB, 3) != 0);
  if (sr & TIM_SR_CC3IF) on_edge(2, TIM2->CCR3, palReadPad(GPIOB, 10) != 0);
  if (sr & TIM_SR_CC4IF) on_edge(3, TIM2->CCR4, palReadPad(GPIOB, 11) != 0);
  OSAL_IRQ_EPILOGUE();
}

OSAL_IRQ_HANDLER(STM32_TIM1_UP_TIM10_HANDLER) {
  OSAL_IRQ_PROLOGUE();
  if (TIM1->SR & TIM_SR_UIF) {
    TIM1->SR = ~TIM_SR_UIF;
    tim1Overflows++;
  }
  OSAL_IRQ_EPILOGUE();
}

OSAL_IRQ_HANDLER(STM32_TIM1_CC_HANDLER) {
  OSAL_IRQ_PROLOGUE();
  if (TIM1->SR & TIM_SR_CC1IF) {
    uint32_t cap = TIM1->CCR1;            /* reading CCR1 clears the flag */
    uint32_t hi = tim1Overflows;
    if ((TIM1->SR & TIM_SR_UIF) && cap < 0x8000U) hi++;     /* overflow happened just before this capture */
    on_edge(4, (hi << 16) | cap, palReadPad(GPIOA, 8) != 0);
  }
  OSAL_IRQ_EPILOGUE();
}

/* capture polarity: SENT wants falling edges only, everything else both edges */
static void set_polarity(int ch, bool fallingOnly) {
  if (ch < 4) {
    uint32_t sh = (uint32_t)ch * 4U;
    uint32_t v = TIM2->CCER & ~(0xAU << sh);
    v |= (fallingOnly ? 0x2U : 0xAU) << sh;       /* CCxP (falling) and CCxNP (both) */
    TIM2->CCER = v;
  } else {
    uint32_t v = TIM1->CCER & ~0xAU;
    v |= fallingOnly ? 0x2U : 0xAU;
    TIM1->CCER = v;
  }
}

static void load_cfg(int i) {
  const fq_cfg_t *c = CFG_FQ(&cfg, i);
  fq_t *f = &fq[i];
  if (f->mode != c->mode) {
    f->haveRise = f->haveFall = f->haveAny = false;
    f->period = f->high = f->low = f->count = 0;
    f->sentSync = false; f->hlNext = 0;
    f->hpScore[0] = f->hpScore[1] = f->hpScore[2] = 0;
    set_polarity(i, c->mode == 9);
  }
  f->edge = c->edge;
  f->minTicks = (uint32_t)c->minPeriodUs * TICKS_PER_US;
  f->sentNominal = clampf(c->sentTickUs, 1.0f, 90.0f) * TICKS_PER_US;
  f->mode = c->mode;
}

/* Timers TIM2 (4 x 32 bit capture) and TIM1 (1 x 16 bit capture, extended by an overflow counter), both at 4 MHz. */
void freq_init(void) {
  for (int i = 0; i < N_FQ; i++) {
    const fq_cfg_t *c = CFG_FQ(&cfg, i);
    iomode_t pull = (c->pull == 1) ? PAL_STM32_PUPDR_PULLUP : (c->pull == 2) ? PAL_STM32_PUPDR_PULLDOWN : PAL_STM32_PUPDR_FLOATING;
    palSetPadMode(fq[i].port, fq[i].pad, PAL_MODE_ALTERNATE(1) | pull);
  }

  rccEnableTIM2(true);
  rccResetTIM2();
  TIM2->PSC = (STM32_TIMCLK1 / 4000000U) - 1U;
  TIM2->ARR = 0xFFFFFFFFU;
  TIM2->CCMR1 = TIM_CCMR1_CC1S_0 | (3U << 4) | TIM_CCMR1_CC2S_0 | (3U << 12);      /* inputs, filter of 8 samples */
  TIM2->CCMR2 = TIM_CCMR2_CC3S_0 | (3U << 4) | TIM_CCMR2_CC4S_0 | (3U << 12);
  TIM2->CCER = TIM_CCER_CC1E | TIM_CCER_CC2E | TIM_CCER_CC3E | TIM_CCER_CC4E;
  TIM2->EGR = TIM_EGR_UG;
  TIM2->SR = 0;

  rccEnableTIM1(true);
  rccResetTIM1();
  TIM1->PSC = (STM32_TIMCLK2 / 4000000U) - 1U;
  TIM1->ARR = 0xFFFFU;
  TIM1->CCMR1 = TIM_CCMR1_CC1S_0 | (3U << 4);
  TIM1->CCER = TIM_CCER_CC1E;
  TIM1->EGR = TIM_EGR_UG;
  TIM1->SR = 0;

  for (int i = 0; i < N_FQ; i++) {
    fq[i].mode = 0xFF;                  /* force load_cfg to set the polarity */
    load_cfg(i);
  }

  TIM2->DIER = TIM_DIER_CC1IE | TIM_DIER_CC2IE | TIM_DIER_CC3IE | TIM_DIER_CC4IE;
  TIM1->DIER = TIM_DIER_CC1IE | TIM_DIER_UIE;
  nvicEnableVector(STM32_TIM2_NUMBER, 6);
  nvicEnableVector(STM32_TIM1_UP_TIM10_NUMBER, 6);
  nvicEnableVector(STM32_TIM1_CC_NUMBER, 6);
  TIM2->CR1 = TIM_CR1_CEN;
  TIM1->CR1 = TIM_CR1_CEN;
}

static float lp(float prev, float in, uint8_t percent) {
  if (percent > 99) percent = 99;
  return prev + (1.0f - (float)percent / 100.0f) * (in - prev);
}

/* Called every 10 ms: turns the captured timings into the configured value for each input. */
void freq_update(void) {
  uint32_t t = now_ms();
  for (int i = 0; i < N_FQ; i++) {
    const fq_cfg_t *c = CFG_FQ(&cfg, i);
    fq_t *f = &fq[i];
    load_cfg(i);
    if (c->mode == 0) {
      live.fqHz[i] = live.fqValue[i] = live.fqValue2[i] = 0.0f; live.fqFault[i] = false;
      continue;
    }
    uint32_t timeout = c->timeoutMs ? c->timeoutMs : 500U;
    bool alive = (t - f->lastEdgeMs) < timeout && (f->haveAny || f->haveFall);
    uint32_t period = f->period;
    float hz = (alive && period > 0) ? TIMER_HZ / (float)period : 0.0f;
    float ppr = c->pulsesPerRev > 0.001f ? c->pulsesPerRev : 1.0f;
    float value = 0.0f, value2 = 0.0f;
    bool fault = false;

    switch (c->mode) {
    case 1: value = alive ? hz * c->mult + c->offset : 0.0f; break;
    case 2: value = hz / ppr * c->circumference * 3.6f; break;
    case 3: value = hz / ppr * 60.0f; break;
    case 4:                                    /* flex fuel: 50..150 Hz = 0..100 %, low pulse 1..5 ms = -40..125 C */
      fault = !alive || hz < 40.0f || hz > 160.0f;
      if (!fault) {
        value = clampf(hz - 50.0f, 0.0f, 100.0f);
        value2 = interp(1.0f, -40.0f, 5.0f, 125.0f, (float)f->low * 1000.0f / TIMER_HZ);
      }
      break;
    case 5: value = (alive && period > 0) ? clampf((float)f->high * 100.0f / (float)period, 0.0f, 100.0f) : 0.0f; break;
    case 6: value = (float)f->count * c->mult; break;
    case 7: {                                  /* Hella pressure + temperature (experimental) */
      int diag = -1, candidates = 0;
      for (int p = 0; p < 3; p++) if (f->hpScore[p] >= 6) { candidates++; if (diag < 0 || near_us(f->hpHigh[p], 256)) diag = p; }
      fault = !alive || candidates == 0;
      if (!fault) {
        float tUs = (float)f->hpHigh[(diag + 1) % 3], pUs = (float)f->hpHigh[(diag + 2) % 3];
        value2 = (tUs - 128.0f) / 768.0f * 200.0f - 40.0f;
        value = ((pUs - 128.0f) / 768.0f * 10.0f + 0.5f) * 100.0f;        /* absolute kPa */
        if (c->gauge) value -= c->baro;
        if (!near_us(f->hpHigh[diag], 256)) fault = true;                  /* sensor reports a problem */
      }
      break;
    }
    case 8:                                    /* Hella oil level + temperature */
      fault = (t - f->hlOkMs) > 3000U;
      value = fault ? 0.0f : f->hlLevel;
      value2 = fault ? 0.0f : f->hlTemp;
      hz = 0.0f;
      break;
    case 9:                                    /* SENT */
      fault = (t - f->sentOkMs) > timeout || f->sentOkMs == 0;
      if (!fault) {
        if (c->sentType == 1) {                /* throttle position: both tracks as percent of full scale */
          value = (float)f->sig0 * 100.0f / 4095.0f;
          value2 = (float)f->sig1 * 100.0f / 4095.0f;
        } else if (c->sentType == 2) {         /* custom scaling */
          value = (float)f->sig0 * c->mult + c->offset;
          value2 = (float)f->sig1 * c->mult2 + c->offset2;
        } else {                               /* GM fuel pressure: raw counts until the scaling is confirmed on a sensor */
          value = (float)f->sig0;
          value2 = (float)f->sig1;
        }
      }
      hz = 0.0f;
      break;
    default: break;
    }
    live.fqHz[i] = hz;
    live.fqFault[i] = fault;
    live.fqValue[i] = fault ? 0.0f : lp(live.fqValue[i], value, c->filter);
    live.fqValue2[i] = fault ? 0.0f : lp(live.fqValue2[i], value2, c->filter);
  }
}
