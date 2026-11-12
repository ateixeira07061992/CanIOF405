/*
 * Outputs.
 *   PWM1..PWM4 = PC6..PC9 (TIM3 CH1..CH4)   PWM5, PWM6 = PB6, PB7 (TIM4 CH1, CH2)
 *   OUT7..OUT10 = PB5, PA9, PA10, PC12 (plain GPIO)
 * Each output is driven by a CAN command, by its own 8x8 table (same idea as the rusEFI general purpose PWM),
 * by the fault output function, or by a TunerStudio test command.
 */
#include "canio.h"

static PWMConfig pwmA = { .frequency = 1000000, .period = 10000,
  .channels = { { PWM_OUTPUT_ACTIVE_HIGH, NULL }, { PWM_OUTPUT_ACTIVE_HIGH, NULL }, { PWM_OUTPUT_ACTIVE_HIGH, NULL }, { PWM_OUTPUT_ACTIVE_HIGH, NULL } } };
static PWMConfig pwmB = { .frequency = 1000000, .period = 10000,
  .channels = { { PWM_OUTPUT_ACTIVE_HIGH, NULL }, { PWM_OUTPUT_ACTIVE_HIGH, NULL }, { PWM_OUTPUT_DISABLED, NULL }, { PWM_OUTPUT_DISABLED, NULL } } };

static const struct { ioportid_t port; uint8_t pad; } gpioOut[N_OUT - N_PWM] = {
  { GPIOB, 5 }, { GPIOA, 9 }, { GPIOA, 10 }, { GPIOC, 12 },
};

static int8_t  testState[N_OUT];      /* 0 none, 1 forced on, 2 forced off */
static bool    onOff[N_OUT];
static uint16_t delayTimer[N_OUT];
static float   lastCmd[N_OUT];

/* 16 bit timers: pick a counter clock that gives a usable period for the requested frequency */
static void pwm_setup(PWMConfig *c, uint16_t hz) {
  if (hz < 2) hz = 2;
  uint32_t clk = (hz >= 62) ? 4000000U : (hz >= 16) ? 1000000U : 100000U;
  c->frequency = clk;
  c->period = (pwmcnt_t)(clk / hz);
}

/* Starts the PWM timers and sets all outputs off. PWM frequencies are only read here (restart to change). */
void out_init(void) {
  pwm_setup(&pwmA, cfg.pwmFreqA);
  pwm_setup(&pwmB, cfg.pwmFreqB);
  pwmStart(&PWMD3, &pwmA);
  pwmStart(&PWMD4, &pwmB);
  for (int i = 6; i <= 9; i++) palSetPadMode(GPIOC, i, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOB, 6, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOB, 7, PAL_MODE_ALTERNATE(2));
  for (int i = 0; i < N_OUT - N_PWM; i++) {
    palClearPad(gpioOut[i].port, gpioOut[i].pad);
    palSetPadMode(gpioOut[i].port, gpioOut[i].pad, PAL_MODE_OUTPUT_PUSHPULL);
  }
}

/* TunerStudio test buttons: force one output on / off, or release it back to its normal function. */
void out_test(int index, int state) {
  if (index == 0) {
    if (state < 0) memset(testState, 0, sizeof(testState));
    return;
  }
  if (index < 1 || index > N_OUT) return;
  testState[index - 1] = (state < 0) ? 0 : (state ? 1 : 2);
}

/* Table axis sources, same order as the axis list in the ini */
float axis_value(uint8_t src, bool *fault) {
  bool f = false;
  float v = 0.0f;
  if (src >= 1 && src <= 8) { v = live.anValue[src - 1]; f = live.anFault[src - 1] || CFG_AN(&cfg, src - 1)->mode == 0; }
  else if (src >= 9 && src <= 14) { v = live.egt[src - 9]; f = live.egtFault[src - 9] || !CFG_EGT(&cfg, src - 9)->enable; }
  else if (src == 15) v = live.egtMax;
  else if (src == 16) v = live.egtAvg;
  else if (src == 17) v = live.egtSpread;
  else if (src >= 18 && src <= 22) { v = live.fqValue[src - 18]; f = live.fqFault[src - 18] || CFG_FQ(&cfg, src - 18)->mode == 0; }
  else if (src == 23) v = live.vbatt;
  else if (src == 24) v = live.v5;
  else if (src == 25) v = live.mcuTemp;
  else if (src == 26) { v = live.actPosition; f = live.actFault; }
  else if (src == 27) v = live.actTarget;
  else if (src >= 28 && src < 28 + N_DI) v = live.di[src - 28] ? 1.0f : 0.0f;
  else if (src < AXIS_COUNT && axisEcu[src] >= 0) {
    f = !live.ecuAlive;
    v = f ? 0.0f : live.ecu[axisEcu[src]];
  }
  else if (src >= 48 && src <= 51) v = live.canUser[src - 48];
  if (fault) *fault = f;
  return v;
}

/* Drives the pin: PWM outputs get the duty, plain outputs are on from 50 % up. Also records the live state. */
static void apply(int i, float duty) {
  duty = clampf(duty, 0.0f, 100.0f);
  live.outDuty[i] = duty;
  live.outState[i] = duty > 0.0f;
  if (i < 4) {
    pwmEnableChannel(&PWMD3, (pwmchannel_t)i, PWM_PERCENTAGE_TO_WIDTH(&PWMD3, (uint32_t)(duty * 100.0f)));
  } else if (i < N_PWM) {
    pwmEnableChannel(&PWMD4, (pwmchannel_t)(i - 4), PWM_PERCENTAGE_TO_WIDTH(&PWMD4, (uint32_t)(duty * 100.0f)));
  } else {
    palWritePad(gpioOut[i - N_PWM].port, gpioOut[i - N_PWM].pad, duty >= 50.0f ? 1U : 0U);
  }
}

/* True when any of the conditions selected for the fault output is present. */
static bool fault_condition(void) {
  bool f = false;
  if (cfg.faultOut_onSensor) {
    f = f || live.v5Fault;
    for (int i = 0; i < N_AN; i++) f = f || live.anFault[i];
  }
  if (cfg.faultOut_onEgtWarn) f = f || live.egtWarn;
  if (cfg.faultOut_onEgtCrit) f = f || live.egtCrit;
  if (cfg.faultOut_onEgtProbe) for (int i = 0; i < N_EGT; i++) f = f || live.egtFault[i];
  if (cfg.faultOut_onCan) {
    /* command loss only counts when something is actually driven by CAN commands */
    bool wantCmd = cfg.act_mode != 0 && cfg.act_targetSource == 0;
    for (int i = 0; i < N_OUT; i++) if (CFG_OUT(&cfg, i)->mode == 1) wantCmd = true;
    f = f || (cfg.canEcuProtocol != 0 && !live.ecuAlive) || (wantCmd && !live.cmdAlive);
  }
  if (cfg.faultOut_onActuator) f = f || live.actFault || live.actMismatch;
  return f;
}

/* Called every 10 ms. For each output, in priority order: test override, fault output function,
 * low battery / configuration error cut-off, then its normal mode (CAN command, table, always on). */
void out_update(void) {
  bool cutoff = cfg.vbattOutputCutoff > 0.0f && live.vbatt < cfg.vbattOutputCutoff;
  bool faultNow = fault_condition();
  live.faultOutActive = cfg.faultOut_pin != 0 && faultNow;

  for (int i = 0; i < N_OUT; i++) {
    const out_cfg_t *o = CFG_OUT(&cfg, i);
    bool pwmType = (i < N_PWM) && o->pwm;
    float want = 0.0f;         /* requested duty before polarity */
    bool direct = false;       /* true: no hysteresis / delays (test, fault output, on-off commands) */

    if (testState[i]) {
      apply(i, testState[i] == 1 ? 100.0f : 0.0f);
      continue;
    }
    if (cfg.faultOut_pin == i + 1) {
      bool on = faultNow && (!cfg.faultOut_blink || ((now_ms() / 250U) & 1U));
      want = on ? 100.0f : 0.0f;
      direct = true;
    } else if (cutoff || live.configError) {
      want = 0.0f; direct = true;
    } else {
      bool useTable = false;
      switch (o->mode) {
      case 1:                                    /* CAN command */
        if (live.cmdAlive) {
          if (pwmType) {
            want = live.cmdPwmDuty[i] * 0.5f;
          } else {
            want = (live.cmdOutBits & (1U << i)) ? 100.0f : 0.0f;
            direct = true;
          }
          lastCmd[i] = want;
        } else {
          switch (o->failsafe) {
          case 1: want = 100.0f; direct = true; break;
          case 2: want = lastCmd[i]; direct = true; break;
          case 3: useTable = true; break;
          default: want = 0.0f; direct = true; break;
          }
        }
        break;
      case 2: useTable = true; break;
      case 3: want = 100.0f; direct = true; break;
      default: want = 0.0f; direct = true; break;
      }
      if (useTable) {
        bool fx, fy;
        float x = axis_value(o->axisX, &fx), y = axis_value(o->axisY, &fy);
        live.outAxisX[i] = x; live.outAxisY[i] = y;
        want = (fx || fy) ? (float)o->dutyIfError : table8x8(o->xBins, o->yBins, o->table, x, y);
      }
    }

    float duty;
    if (pwmType && !direct) {
      duty = want;
      if (duty > 0.0f) duty = clampf(duty, (float)o->minDuty, (float)o->maxDuty);
    } else if (direct) {
      onOff[i] = want >= 50.0f;
      delayTimer[i] = 0;
      duty = pwmType ? want : (onOff[i] ? 100.0f : 0.0f);
    } else {
      /* on / off output following a table: hysteresis and delays */
      bool target = onOff[i];
      if (want > (float)o->onAbove) target = true;
      else if (want < (float)o->offBelow) target = false;
      if (target != onOff[i]) {
        uint16_t need = target ? o->onDelayMs : o->offDelayMs;
        if (delayTimer[i] >= need) { onOff[i] = target; delayTimer[i] = 0; }
        else delayTimer[i] = (uint16_t)(delayTimer[i] + 10);
      } else {
        delayTimer[i] = 0;
      }
      duty = onOff[i] ? 100.0f : 0.0f;
    }
    if (o->invert) duty = 100.0f - duty;
    apply(i, duty);
  }
}
