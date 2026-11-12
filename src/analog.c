/*
 * Analog inputs: 16 channels sampled continuously by ADC1 with DMA.
 *   EGT1..EGT6 = PA0..PA5 (IN0..IN5)      AN1, AN2 = PA6, PA7 (IN6, IN7)
 *   5 V sensor rail = PB0 (IN8)           battery = PB1 (IN9)
 *   AN3..AN8 = PC0..PC5 (IN10..IN15)
 */
#include "canio.h"

#define ADC_CH     16
#define ADC_DEPTH  16

static adcsample_t samples[ADC_CH * ADC_DEPTH];
static volatile float adcAvg[ADC_CH];       /* averaged raw counts, written from the ADC callback */

static void adc_cb(ADCDriver *adcp) {
  /* called at half buffer and at full buffer: average the half that just completed */
  const adcsample_t *p = adcIsBufferComplete(adcp) ? &samples[(ADC_DEPTH / 2) * ADC_CH] : &samples[0];
  uint32_t sum[ADC_CH] = { 0 };
  for (int s = 0; s < ADC_DEPTH / 2; s++) {
    for (int c = 0; c < ADC_CH; c++) {
      sum[c] += *p++;
    }
  }
  for (int c = 0; c < ADC_CH; c++) {
    adcAvg[c] = (float)sum[c] / (ADC_DEPTH / 2);
  }
}

static const ADCConversionGroup adcGroup = {
  .circular     = true,
  .num_channels = ADC_CH,
  .end_cb       = adc_cb,
  .error_cb     = NULL,
  .cr1          = 0,
  .cr2          = ADC_CR2_SWSTART,
  .smpr1        = ADC_SMPR1_SMP_AN10(ADC_SAMPLE_144) | ADC_SMPR1_SMP_AN11(ADC_SAMPLE_144) | ADC_SMPR1_SMP_AN12(ADC_SAMPLE_144) |
                  ADC_SMPR1_SMP_AN13(ADC_SAMPLE_144) | ADC_SMPR1_SMP_AN14(ADC_SAMPLE_144) | ADC_SMPR1_SMP_AN15(ADC_SAMPLE_144),
  .smpr2        = ADC_SMPR2_SMP_AN0(ADC_SAMPLE_144) | ADC_SMPR2_SMP_AN1(ADC_SAMPLE_144) | ADC_SMPR2_SMP_AN2(ADC_SAMPLE_144) |
                  ADC_SMPR2_SMP_AN3(ADC_SAMPLE_144) | ADC_SMPR2_SMP_AN4(ADC_SAMPLE_144) | ADC_SMPR2_SMP_AN5(ADC_SAMPLE_144) |
                  ADC_SMPR2_SMP_AN6(ADC_SAMPLE_144) | ADC_SMPR2_SMP_AN7(ADC_SAMPLE_144) | ADC_SMPR2_SMP_AN8(ADC_SAMPLE_144) |
                  ADC_SMPR2_SMP_AN9(ADC_SAMPLE_144),
  .htr          = 0,
  .ltr          = 0,
  .sqr1         = ADC_SQR1_NUM_CH(ADC_CH) | ADC_SQR1_SQ13_N(ADC_CHANNEL_IN12) | ADC_SQR1_SQ14_N(ADC_CHANNEL_IN13) |
                  ADC_SQR1_SQ15_N(ADC_CHANNEL_IN14) | ADC_SQR1_SQ16_N(ADC_CHANNEL_IN15),
  .sqr2         = ADC_SQR2_SQ7_N(ADC_CHANNEL_IN6) | ADC_SQR2_SQ8_N(ADC_CHANNEL_IN7) | ADC_SQR2_SQ9_N(ADC_CHANNEL_IN8) |
                  ADC_SQR2_SQ10_N(ADC_CHANNEL_IN9) | ADC_SQR2_SQ11_N(ADC_CHANNEL_IN10) | ADC_SQR2_SQ12_N(ADC_CHANNEL_IN11),
  .sqr3         = ADC_SQR3_SQ1_N(ADC_CHANNEL_IN0) | ADC_SQR3_SQ2_N(ADC_CHANNEL_IN1) | ADC_SQR3_SQ3_N(ADC_CHANNEL_IN2) |
                  ADC_SQR3_SQ4_N(ADC_CHANNEL_IN3) | ADC_SQR3_SQ5_N(ADC_CHANNEL_IN4) | ADC_SQR3_SQ6_N(ADC_CHANNEL_IN5),
};

/* ADC channel number of each analog input AN1..AN8 */
static const uint8_t anChannel[N_AN] = { 6, 7, 10, 11, 12, 13, 14, 15 };

void analog_init(void) {
  for (int i = 0; i <= 7; i++) palSetPadMode(GPIOA, i, PAL_MODE_INPUT_ANALOG);
  palSetPadMode(GPIOB, 0, PAL_MODE_INPUT_ANALOG);
  palSetPadMode(GPIOB, 1, PAL_MODE_INPUT_ANALOG);
  for (int i = 0; i <= 5; i++) palSetPadMode(GPIOC, i, PAL_MODE_INPUT_ANALOG);
  adcStart(&ADCD1, NULL);
  adcStartConversion(&ADCD1, &adcGroup, samples, ADC_DEPTH);
}

/* Ready-made linear calibrations, same order as the ini list. Pressures in kPa. Approximate: check the sensor datasheet. */
static const float linPreset[][4] = {
  { 0.5f, 0.0f, 4.5f, 1000.0f },     /* 0 custom (not used) */
  { 0.5f, 0.0f, 4.5f, 689.5f },      /* 1 0-100 psi */
  { 0.5f, 0.0f, 4.5f, 1034.2f },     /* 2 0-150 psi */
  { 0.5f, 0.0f, 4.5f, 1379.0f },     /* 3 0-200 psi */
  { 0.5f, 0.0f, 4.5f, 1000.0f },     /* 4 0-10 bar */
  { 0.0f, 10.0f, 5.0f, 105.0f },     /* 5 GM 1 bar MAP */
  { 0.0f, 8.8f, 5.0f, 208.0f },      /* 6 GM 2 bar MAP */
  { 0.631f, 40.0f, 4.914f, 304.0f }, /* 7 GM 3 bar MAP */
  { 0.306f, 20.0f, 4.897f, 105.0f }, /* 8 MPX4100 */
  { 0.2f, 20.0f, 4.9f, 250.0f },     /* 9 MPX4250 */
  { 0.2f, 20.0f, 4.8f, 400.0f },     /* 10 MPXH6400 */
  { 0.4f, 20.0f, 4.65f, 250.0f },    /* 11 Bosch 2.5 bar */
  { 0.0f, 0.0f, 5.0f, 100.0f },      /* 12 0-5 V = 0-100 % */
};
#define LIN_PRESETS ((int)(sizeof(linPreset) / sizeof(linPreset[0])))

/* Thermistor presets: three temperature (C) / resistance (ohm) points */
static const float thermPreset[][6] = {
  { 0, 5896, 20, 2500, 80, 323 },        /* 0 custom (not used) */
  { 0, 5896, 20, 2500, 80, 323 },        /* 1 Bosch NTC 2.5k @ 20 C */
  { -40, 100700, 20, 3520, 100, 177 },   /* 2 GM CLT / IAT */
};

/* Steinhart-Hart from three points */
static float thermistor_temp(float r, const float *p) {
  float l1 = logf(p[1]), l2 = logf(p[3]), l3 = logf(p[5]);
  float y1 = 1.0f / (p[0] + 273.15f), y2 = 1.0f / (p[2] + 273.15f), y3 = 1.0f / (p[4] + 273.15f);
  if (l2 == l1 || l3 == l1 || l3 == l2) return 0.0f;
  float g2 = (y2 - y1) / (l2 - l1);
  float g3 = (y3 - y1) / (l3 - l1);
  float c = ((g3 - g2) / (l3 - l2)) / (l1 + l2 + l3);
  float b = g2 - c * (l1 * l1 + l1 * l2 + l2 * l2);
  float a = y1 - (b + l1 * l1 * c) * l1;
  float l = logf(r);
  float inv = a + b * l + c * l * l * l;
  if (inv <= 0.0f) return 0.0f;
  return 1.0f / inv - 273.15f;
}

static float filt(float prev, float in, uint8_t percent) {
  if (percent > 99) percent = 99;
  float alpha = 1.0f - (float)percent / 100.0f;
  return prev + alpha * (in - prev);
}

static uint16_t anErrTimer[N_AN];
static uint16_t egtWarnTimer, egtCritTimer;
static bool analogPrimed;

void analog_update(void) {
  const float lsb = cfg.adcVref / 4095.0f;

  /* supply monitors */
  float v5 = adcAvg[8] * lsb * cfg.v5Divider;
  float vb = adcAvg[9] * lsb * cfg.vbattDivider;
  live.v5 = analogPrimed ? filt(live.v5, v5, 80) : v5;
  live.vbatt = analogPrimed ? filt(live.vbatt, vb, 80) : vb;
  bool v5ok = live.v5 > 4.0f && live.v5 < 6.0f;
  float ratio = v5ok ? (cfg.v5Nominal / live.v5) : 1.0f;

  /* analog inputs */
  for (int i = 0; i < N_AN; i++) {
    const an_cfg_t *a = CFG_AN(&cfg, i);
    float v = adcAvg[anChannel[i]] * lsb * cfg.analogDivider;
    live.anVolts[i] = v;                       /* always the real voltage at the connector */
    if (a->mode == 0) {
      live.anValue[i] = 0.0f; live.anFault[i] = false; live.anSwitch[i] = false; anErrTimer[i] = 0;
      continue;
    }
    if (a->mode == 4) {                        /* switch */
      bool on = live.anSwitch[i] != (a->swInvert != 0);     /* undo polarity to get the raw comparator state */
      if (v > a->swThreshold + a->swHyst * 0.5f) on = true;
      else if (v < a->swThreshold - a->swHyst * 0.5f) on = false;
      live.anSwitch[i] = on != (a->swInvert != 0);
      live.anValue[i] = live.anSwitch[i] ? 1.0f : 0.0f;
      live.anFault[i] = false;
      continue;
    }
    live.anSwitch[i] = false;
    float vr = a->ratiometric ? v * ratio : v;
    float value = vr;
    switch (a->mode) {
    case 1: {                                  /* linear */
      float v1 = a->v1, x1 = a->val1, v2 = a->v2, x2 = a->val2;
      if (a->linPreset > 0 && a->linPreset < LIN_PRESETS) {
        const float *p = linPreset[a->linPreset];
        v1 = p[0]; x1 = p[1]; v2 = p[2]; x2 = p[3];
      }
      value = (v2 != v1) ? x1 + (vr - v1) * (x2 - x1) / (v2 - v1) : x1;
      break;
    }
    case 2: {                                  /* thermistor with pull-up to the sensor rail */
      float vs = a->ratiometric ? cfg.v5Nominal : (v5ok ? live.v5 : cfg.v5Nominal);
      float pts[6] = { a->t1, a->r1, a->t2, a->r2, a->t3, a->r3 };
      const float *p = (a->thermPreset == 1 || a->thermPreset == 2) ? thermPreset[a->thermPreset] : pts;
      if (vr >= vs - 0.02f || vr <= 0.005f) {
        value = a->fallback;
      } else {
        float rpar = a->bias * vr / (vs - vr);                 /* thermistor in parallel with the input stage */
        float load = cfg.analogInputLoad * 1000.0f;
        float g = 1.0f / rpar - ((load > 1.0f) ? 1.0f / load : 0.0f);
        float r = (g > 1e-9f) ? 1.0f / g : 1e9f;
        value = thermistor_temp(r, p);
      }
      break;
    }
    case 3: {                                  /* custom curve */
      const curve_cfg_t *c = CFG_CURVE(&cfg, a->curve & 3);
      value = curve_lookup(c->bins, c->values, 16, vr);
      break;
    }
    default:                                   /* 5: raw voltage */
      value = v;
      break;
    }
    /* range check on the real voltage */
    if (v < a->errLow || v > a->errHigh) {
      if (anErrTimer[i] < 60000) anErrTimer[i] += 10;
    } else {
      anErrTimer[i] = 0;
    }
    live.anFault[i] = anErrTimer[i] > a->errDelayMs;
    if (live.anFault[i]) {
      live.anValue[i] = a->fallback;
    } else {
      live.anValue[i] = analogPrimed ? filt(live.anValue[i], value, a->filter) : value;
    }
  }

  /* EGT */
  float max = -1000.0f, min = 10000.0f, sum = 0.0f, cmax = -1000.0f, cmin = 10000.0f;
  int n = 0, ncyl = 0;
  for (int i = 0; i < N_EGT; i++) {
    const egt_cfg_t *e = CFG_EGT(&cfg, i);
    float v = adcAvg[i] * lsb * cfg.egtDivider;
    live.egtVolts[i] = v;
    if (!e->enable) {
      live.egt[i] = 0.0f; live.egtFault[i] = false;
      continue;
    }
    live.egtFault[i] = v > cfg.egtOpenV;
    if (live.egtFault[i]) {
      live.egt[i] = 0.0f;
      continue;
    }
    float t = (cfg.egtGain > 0.0f) ? (v - cfg.egtZeroV) * 1000.0f / cfg.egtGain : 0.0f;
    t += (float)e->trim * CFG_SCALE_egt1_trim;
    live.egt[i] = analogPrimed ? filt(live.egt[i], t, cfg.egtFilter) : t;
    t = live.egt[i];
    if (t > max) max = t;
    if (t < min) min = t;
    sum += t; n++;
    if (e->position >= 1 && e->position <= 8) {          /* cylinder probes take part in the spread check */
      if (t > cmax) cmax = t;
      if (t < cmin) cmin = t;
      ncyl++;
    }
  }
  live.egtMax = n ? max : 0.0f;
  live.egtMin = n ? min : 0.0f;
  live.egtAvg = n ? sum / n : 0.0f;
  live.egtSpread = (ncyl >= 2) ? cmax - cmin : 0.0f;

  bool spread = cfg.egtSpreadMax > 0 && ncyl >= 2 && live.egtAvg > cfg.egtSpreadMinTemp && live.egtSpread > cfg.egtSpreadMax;
  bool warn = n && (live.egtMax > cfg.egtWarnTemp || spread);
  bool crit = n && live.egtMax > cfg.egtCritTemp;
  egtWarnTimer = warn ? (uint16_t)((egtWarnTimer < 60000) ? egtWarnTimer + 10 : egtWarnTimer) : 0;
  egtCritTimer = crit ? (uint16_t)((egtCritTimer < 60000) ? egtCritTimer + 10 : egtCritTimer) : 0;
  live.egtWarn = warn && egtWarnTimer > cfg.egtAlarmDelayMs;
  live.egtCrit = crit && egtCritTimer > cfg.egtAlarmDelayMs;
  live.egtSpreadWarn = live.egtWarn && spread;

  live.mcuTemp = 0.0f;       /* all 16 regular ADC slots are used by the external channels */
  analogPrimed = true;
}
