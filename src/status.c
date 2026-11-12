/* Fault summary, configuration checks and the TunerStudio output channel block. */
#include "canio.h"

static uint32_t bits;
static uint8_t bits2;

uint32_t status_bits(void) { return bits; }
uint8_t  status_bits2(void) { return bits2; }

uint8_t status_di_bits(void) {
  uint8_t b = 0;
  for (int i = 0; i < N_DI; i++) if (live.di[i]) b |= (uint8_t)(1U << i);
  return b;
}

uint8_t status_an_switch_bits(void) {
  uint8_t b = 0;
  for (int i = 0; i < N_AN; i++) if (live.anSwitch[i]) b |= (uint8_t)(1U << i);
  return b;
}

uint16_t status_out_bits(void) {
  uint16_t b = 0;
  for (int i = 0; i < N_OUT; i++) if (live.outState[i]) b |= (uint16_t)(1U << i);
  return b;
}

static bool out_table_active(const out_cfg_t *o) {
  return o->mode == 2 || (o->mode == 1 && o->failsafe == 3);
}

/* Index in the axis source list of each local input, see axis_value() */
static bool axis_used(uint8_t src) {
  for (int i = 0; i < N_OUT; i++) {
    const out_cfg_t *o = CFG_OUT(&cfg, i);
    if (out_table_active(o) && (o->axisX == src || o->axisY == src)) return true;
  }
  bool actTbl = cfg.act_mode != 0 && (cfg.act_targetSource == 1 || (cfg.act_targetSource == 0 && cfg.act_failsafe == 2));
  return actTbl && (cfg.act_axisX == src || cfg.act_axisY == src);
}

/* Same rules as the "Pin usage and conflicts" window of the ini */
static void check_config(void) {
  const char *msg = "";
  for (int i = 0; i < N_OUT && !*msg; i++) {
    if (cfg.faultOut_pin == i + 1 && CFG_OUT(&cfg, i)->mode != 0) msg = "Fault output pin is also used as a normal output";
  }
  if (!*msg && cfg.act_mode != 0) {
    if (cfg.act_posChannel == 0) msg = "Actuator has no position sensor selected";
    else if (cfg.act_posChannel == cfg.act_posChannel2) msg = "Both actuator sensors are on the same input";
    else {
      for (int k = 0; k < 2; k++) {
        uint8_t ch = k ? cfg.act_posChannel2 : cfg.act_posChannel;
        if (ch >= 1 && ch <= N_AN) {
          uint8_t m = CFG_AN(&cfg, ch - 1)->mode;
          if (m == 0 || m == 4) msg = "Actuator sensor is on a disabled or switch input";
        }
      }
    }
  }
  for (int i = 0; i < N_AN && !*msg; i++) if (CFG_AN(&cfg, i)->mode == 0 && axis_used((uint8_t)(1 + i))) msg = "A table axis uses a disabled input";
  for (int i = 0; i < N_EGT && !*msg; i++) if (!CFG_EGT(&cfg, i)->enable && axis_used((uint8_t)(9 + i))) msg = "A table axis uses a disabled input";
  for (int i = 0; i < N_FQ && !*msg; i++) if (CFG_FQ(&cfg, i)->mode == 0 && axis_used((uint8_t)(18 + i))) msg = "A table axis uses a disabled input";
  for (int i = 0; i < N_DI && !*msg; i++) if (!CFG_DI(&cfg, i)->enable && axis_used((uint8_t)(28 + i))) msg = "A table axis uses a disabled input";
  live.configError = *msg != 0;
  strncpy(live.configErrorMsg, msg, sizeof(live.configErrorMsg) - 1);
}

void status_update(void) {
  check_config();

  float dv = live.v5 - cfg.v5Nominal;
  live.v5Fault = (dv > cfg.v5Tolerance) || (dv < -cfg.v5Tolerance);
  live.vbattLow = live.vbatt < cfg.vbattLowWarn;

  bool wantCmd = (cfg.act_mode != 0 && cfg.act_targetSource == 0);
  for (int i = 0; i < N_OUT; i++) if (CFG_OUT(&cfg, i)->mode == 1) wantCmd = true;

  uint32_t b = 0;
  if (live.needBurn) b |= OCH_BIT_needBurnFw;
  if (live.configError) b |= OCH_BIT_configError;
  if (live.canBusOff) b |= OCH_BIT_canBusOff;
  if (cfg.canEcuProtocol != 0 && !live.ecuAlive) b |= OCH_BIT_ecuTimeout;
  if (wantCmd && !live.cmdAlive) b |= OCH_BIT_cmdTimeout;
  if (live.v5Fault) b |= OCH_BIT_v5Fault;
  if (live.vbattLow) b |= OCH_BIT_vbattLow;
  for (int i = 0; i < N_AN; i++) if (live.anFault[i]) b |= (OCH_BIT_an1Fault << i);
  for (int i = 0; i < N_EGT; i++) if (live.egtFault[i]) b |= (OCH_BIT_egt1Fault << i);
  if (live.egtWarn) b |= OCH_BIT_egtWarn;
  if (live.egtCrit) b |= OCH_BIT_egtCrit;
  if (live.egtSpreadWarn) b |= OCH_BIT_egtSpreadWarn;
  if (live.actFault) b |= OCH_BIT_actFault;
  if (live.actCalibrating) b |= OCH_BIT_actCalibrating;
  if (live.actEnabled) b |= OCH_BIT_actEnabled;
  if (live.faultOutActive) b |= OCH_BIT_faultOutActive;
  bits = b;

  uint8_t b2 = 0;
  for (int i = 0; i < N_FQ; i++) if (live.fqFault[i]) b2 |= (uint8_t)(OCH_BIT_fq1Fault << i);
  if (live.actMismatch) b2 |= OCH_BIT_actSensorMismatch;
  if (live.actAutotuning) b2 |= OCH_BIT_actAutotuning;
  bits2 = b2;
}

static int16_t s16(float v) { return (int16_t)clampf(v, -32768.0f, 32767.0f); }
static uint16_t u16(float v) { return (uint16_t)clampf(v, 0.0f, 65535.0f); }

void outputs_pack(uint8_t *block) {
  static outputs_t o;
  memset(&o, 0, sizeof(o));
  o.seconds = live.uptime;
  o.bits4 = bits;
  o.bits8 = status_di_bits();
  o.bits9 = status_an_switch_bits();
  o.bits10 = status_out_bits();
  o.bits12 = bits2;
  o.calibrationMode = live.calibrationMode;
  o.calibrationValue = live.calibrationValue;
  o.vbatt = u16(live.vbatt / OCH_SCALE_vbatt);
  o.v5Rail = u16(live.v5 / OCH_SCALE_v5Rail);
  o.mcuTemp = s16(live.mcuTemp / OCH_SCALE_mcuTemp);
  o.canErrCount = live.canErrCount;
  o.canRxCount = live.canRxCount;
  o.canTxCount = live.canTxCount;
  for (int i = 0; i < N_AN; i++) {
    (&o.an1Volts)[i] = u16(live.anVolts[i] / OCH_SCALE_an1Volts);
    (&o.an1Value)[i] = live.anValue[i];
  }
  for (int i = 0; i < N_EGT; i++) {
    (&o.egt1)[i] = s16(live.egt[i] / OCH_SCALE_egt1);
    (&o.egt1Volts)[i] = u16(live.egtVolts[i] / OCH_SCALE_egt1Volts);
  }
  o.egtMax = s16(live.egtMax / OCH_SCALE_egtMax);
  o.egtMin = s16(live.egtMin / OCH_SCALE_egtMin);
  o.egtAvg = s16(live.egtAvg / OCH_SCALE_egtAvg);
  o.egtSpread = s16(live.egtSpread / OCH_SCALE_egtSpread);
  for (int i = 0; i < N_FQ; i++) {
    (&o.fq1Hz)[i] = live.fqHz[i];
    (&o.fq1Value)[i] = live.fqValue[i];
    (&o.fq1Value2)[i] = live.fqValue2[i];
  }
  for (int i = 0; i < N_OUT; i++) {
    (&o.out1Duty)[i] = (uint8_t)clampf(live.outDuty[i] / OCH_SCALE_out1Duty, 0.0f, 255.0f);
    (&o.out1AxisX)[2 * i] = live.outAxisX[i];
    (&o.out1AxisX)[2 * i + 1] = live.outAxisY[i];
  }
  o.actPosition = s16(live.actPosition / OCH_SCALE_actPosition);
  o.actTarget = s16(live.actTarget / OCH_SCALE_actTarget);
  o.actDuty = s16(live.actDuty / OCH_SCALE_actDuty);
  o.actError = s16(live.actError / OCH_SCALE_actError);
  o.actPosition2 = s16(live.actPosition2 / OCH_SCALE_actPosition2);
  o.actPosDiff = s16(live.actPosDiff / OCH_SCALE_actPosDiff);
  o.actPosVolts = u16(live.actPosVolts / OCH_SCALE_actPosVolts);
  o.actPosVolts2 = u16(live.actPosVolts2 / OCH_SCALE_actPosVolts2);
  o.actTuneKu = live.actTuneKu; o.actTuneTu = live.actTuneTu;
  o.actTuneP = live.actTuneP; o.actTuneI = live.actTuneI; o.actTuneD = live.actTuneD;
  o.tsUsbRate = live.tsRate[0];
  o.tsSerialRate = live.tsRate[1];
  o.ecuFrameRate = live.ecuFrameRate;
  for (int i = 0; i < 12; i++) (&o.ecuFrame0Rate)[i] = live.ecuFrameRateN[i];
  o.actAxisX = live.actAxisX; o.actAxisY = live.actAxisY;
  for (int i = 0; i < 4; i++) (&o.canUser1)[i] = live.canUser[i];

  memset(block, 0, OUTPUT_BLOCK_SIZE);
  memcpy(block, &o, sizeof(o));

  /* ECU values: positions and scales come from the generated table */
  for (int i = 0; i < ECU_COUNT; i++) {
    const ecu_och_t *e = &ecuOch[i];
    float raw = live.ecuAlive ? live.ecu[i] / e->scale : 0.0f;
    uint8_t *p = block + e->offset;
    switch (e->type) {
    case 0: p[0] = (uint8_t)clampf(raw + 0.5f, 0.0f, 255.0f); break;
    case 1: p[0] = (uint8_t)(int8_t)clampf(raw, -128.0f, 127.0f); break;
    case 2: { uint16_t v = u16(raw + 0.5f); p[0] = (uint8_t)v; p[1] = (uint8_t)(v >> 8); break; }
    default: { int16_t v = s16(raw); p[0] = (uint8_t)v; p[1] = (uint8_t)((uint16_t)v >> 8); break; }
    }
  }
}
