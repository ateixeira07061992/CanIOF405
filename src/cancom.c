/*
 * CAN bus (CAN1, RX = PB8, TX = PB9).
 *
 * Frames sent (ID = canTxBaseId + n):
 *   +0  fault bits u32, digital inputs u8, analog switch states u8, output states u16
 *   +1  AN1..AN4 value (s16 x canScale)        +2  AN5..AN8 value
 *   +3  AN1..AN4 millivolts (u16)              +4  AN5..AN8 millivolts
 *   +5  EGT1..EGT4 (s16, 0.1 C)                +6  EGT5, EGT6, EGT max, EGT spread
 *   +7  FREQ1..FREQ4 value (u16 x canScale)    +8  FREQ5 value, battery mV, 5 V rail mV, MCU temperature 0.1 C
 *   +9  actuator position, target, duty (s16, 0.01 %), state u8 (bit0 enabled, 1 fault, 2 mismatch, 3 calibrating, 4 autotune)
 *   +10 FREQ1..FREQ4 second value (s16)        +11 FREQ5 second value, actuator position 2, sensor difference, status bits 2
 * Frames accepted (ID = canRxBaseId + n):
 *   +0  output on/off bits u16 (bit 0 = output 1)
 *   +1  PWM1..PWM6 duty, one byte each, 0.5 % per bit
 *   +2  actuator target s16 0.01 %, enable u8
 *   +3  user value 1, 2 (float)                +4  user value 3, 4 (float)
 * ECU values come from the rusEFI / epicEFI verbose broadcast (can_verbose.cpp).
 */
#include "canio.h"

static CANConfig canCfg;
static uint32_t lastEcuMs, lastCmdMs;
static bool ecuSeen, cmdSeen;
static uint8_t lastDi;

static uint16_t rd16(const uint8_t *p, bool be) { return be ? (uint16_t)((p[0] << 8) | p[1]) : (uint16_t)(p[0] | (p[1] << 8)); }
static void wr16(uint8_t *p, int32_t v, bool be) {
  if (be) { p[0] = (uint8_t)(v >> 8); p[1] = (uint8_t)v; } else { p[0] = (uint8_t)v; p[1] = (uint8_t)(v >> 8); }
}
static int32_t sat_s16(float v) { return v > 32767.0f ? 32767 : v < -32768.0f ? -32768 : (int32_t)lroundf(v); }
static int32_t sat_u16(float v) { return v > 65535.0f ? 65535 : v < 0.0f ? 0 : (int32_t)lroundf(v); }
static float scale_of(uint8_t s) { return s == 1 ? 10.0f : s == 2 ? 100.0f : 1.0f; }

/*
 * Transmit queue. The bxCAN has only three transmit mailboxes, so the frames prepared in one 10 ms tick
 * are queued here and a thread feeds them to the bus one by one.
 */
#define TXQ 32
static CANTxFrame txq[TXQ];
static volatile uint8_t txHead, txTail;
static binary_semaphore_t txSem;

static void send(uint32_t n, const uint8_t *d) {
  uint8_t next = (uint8_t)((txHead + 1U) % TXQ);
  if (next == txTail) {                     /* queue full: the bus is not taking frames */
    if (live.canErrCount < 0xFFFF) live.canErrCount++;
    return;
  }
  CANTxFrame *f = &txq[txHead];
  memset(f, 0, sizeof(*f));
  if (cfg.canExtendedId) { f->IDE = CAN_IDE_EXT; f->EID = (cfg.canTxBaseId + n) & 0x1FFFFFFFU; }
  else { f->IDE = CAN_IDE_STD; f->SID = (cfg.canTxBaseId + n) & 0x7FFU; }
  f->RTR = CAN_RTR_DATA;
  f->DLC = 8;
  memcpy(f->data8, d, 8);
  txHead = next;
  chBSemSignal(&txSem);
}

static THD_WORKING_AREA(waCanTx, 512);
static THD_FUNCTION(canTxThread, arg) {
  (void)arg;
  chRegSetThreadName("can tx");
  while (true) {
    chBSemWaitTimeout(&txSem, TIME_MS2I(20));
    while (txTail != txHead) {
      if (canTransmitTimeout(&CAND1, CAN_ANY_MAILBOX, &txq[txTail], TIME_MS2I(20)) == MSG_OK) {
        live.canTxCount++;
        txTail = (uint8_t)((txTail + 1U) % TXQ);
      } else {
        /* nobody acknowledges: drop what is waiting instead of sending stale values later */
        if (live.canErrCount < 0xFFFF) live.canErrCount++;
        txTail = txHead;
      }
    }
  }
}

/* rusEFI / epicEFI verbose broadcast, see can_verbose.cpp. Always little endian. */
static uint16_t ecuCount[12];

static void decode_ecu(uint32_t n, const uint8_t *d) {
  float *e = live.ecu;
  switch (n) {
  case 0:
    e[ECU_WarnCount] = rd16(d, false); e[ECU_ErrorCode] = rd16(d + 2, false);
    e[ECU_RevLimitActive] = (d[4] >> 0) & 1; e[ECU_MainRelay] = (d[4] >> 1) & 1; e[ECU_FuelPump] = (d[4] >> 2) & 1;
    e[ECU_CheckEngine] = (d[4] >> 3) & 1; e[ECU_O2Heater] = (d[4] >> 4) & 1; e[ECU_LambdaProtect] = (d[4] >> 5) & 1;
    e[ECU_Fan1] = (d[4] >> 6) & 1; e[ECU_Fan2] = (d[4] >> 7) & 1;
    e[ECU_Gear] = (int8_t)d[5]; e[ECU_Distance] = rd16(d + 6, false) * 0.1f;
    break;
  case 1:
    e[ECU_Rpm] = rd16(d, false); e[ECU_Timing] = (int16_t)rd16(d + 2, false) * 0.02f;
    e[ECU_InjDuty] = d[4] * 0.5f; e[ECU_CoilDuty] = d[5] * 0.5f; e[ECU_Vss] = d[6]; e[ECU_Flex] = d[7];
    break;
  case 2:
    e[ECU_Pedal] = (int16_t)rd16(d, false) * 0.01f; e[ECU_Tps] = (int16_t)rd16(d + 2, false) * 0.01f;
    e[ECU_Tps2] = (int16_t)rd16(d + 4, false) * 0.01f; e[ECU_Wastegate] = (int16_t)rd16(d + 6, false) * 0.01f;
    break;
  case 3:
    e[ECU_Map] = rd16(d, false) / 30.0f; e[ECU_Clt] = (float)d[2] - 40.0f; e[ECU_Iat] = (float)d[3] - 40.0f;
    e[ECU_Aux1] = (float)d[4] - 40.0f; e[ECU_Aux2] = (float)d[5] - 40.0f; e[ECU_McuTemp] = (float)d[6] - 40.0f;
    e[ECU_FuelLevel] = d[7] * 0.5f;
    break;
  case 4:
    e[ECU_RevLimit] = rd16(d, false); e[ECU_OilPress] = (int16_t)rd16(d + 2, false) / 30.0f;
    e[ECU_OilTemp] = (float)d[4] - 40.0f; e[ECU_FuelTemp] = (float)d[5] - 40.0f; e[ECU_Vbatt] = rd16(d + 6, false) * 0.001f;
    break;
  case 5:
    e[ECU_CylAirmass] = rd16(d, false) * 0.001f; e[ECU_Airflow] = rd16(d + 2, false) * 0.01f;
    e[ECU_InjPulse] = rd16(d + 4, false) / 300.0f; e[ECU_KnockCount] = rd16(d + 6, false);
    break;
  case 6:
    e[ECU_FuelConsumed] = rd16(d, false); e[ECU_FuelFlow] = rd16(d + 2, false) / 200.0f;
    e[ECU_Trim1] = (int16_t)rd16(d + 4, false) * 0.01f; e[ECU_Trim2] = (int16_t)rd16(d + 6, false) * 0.01f;
    break;
  case 7:
    e[ECU_Lambda] = rd16(d, false) * 0.0001f; e[ECU_Lambda2] = rd16(d + 2, false) * 0.0001f;
    e[ECU_FuelPress] = rd16(d + 4, false) / 30.0f; e[ECU_FuelPressHigh] = rd16(d + 6, false) * 0.1f;
    break;
  case 8:
    e[ECU_CamIn1] = (int8_t)d[0]; e[ECU_CamInTarget1] = (int8_t)d[1]; e[ECU_CamEx1] = (int8_t)d[2]; e[ECU_CamExTarget1] = (int8_t)d[3];
    e[ECU_CamIn2] = (int8_t)d[4]; e[ECU_CamInTarget2] = (int8_t)d[5]; e[ECU_CamEx2] = (int8_t)d[6]; e[ECU_CamExTarget2] = (int8_t)d[7];
    break;
  case 9: e[ECU_Egt1] = d[0] * 5.0f; e[ECU_Egt2] = d[1] * 5.0f; break;
  case 10: for (int i = 0; i < 8; i++) e[ECU_Knock1 + i] = (int8_t)d[i]; break;
  case 11: e[ECU_Brake] = d[0] & 1; break;
  default: return;
  }
  ecuCount[n]++;
  /* the optional frames (cams, EGT, knock, brake) do not keep the ECU alive on their own */
  if (n <= 7) { lastEcuMs = now_ms(); ecuSeen = true; }
}

/* Command frames from the ECU (canRxBaseId + n). Any valid one refreshes the command timeout. */
static void decode_cmd(uint32_t n, const uint8_t *d, uint8_t dlc) {
  bool be = cfg.canBigEndian;
  switch (n) {
  case 0: if (dlc < 2) return; live.cmdOutBits = rd16(d, be); break;
  case 1: for (int i = 0; i < N_PWM && i < dlc; i++) live.cmdPwmDuty[i] = d[i] > 200 ? 200 : d[i]; break;
  case 2: if (dlc < 3) return; live.cmdActTarget = (int16_t)rd16(d, be) * 0.01f; live.cmdActEnable = d[2] != 0; break;
  case 3:
  case 4: {
    if (dlc < 8) return;
    for (int k = 0; k < 2; k++) {
      uint8_t b[4];
      for (int j = 0; j < 4; j++) b[j] = be ? d[k * 4 + 3 - j] : d[k * 4 + j];
      float v; memcpy(&v, b, 4);
      if (isfinite(v)) live.canUser[(n - 3) * 2 + k] = v;
    }
    break;
  }
  default: return;
  }
  lastCmdMs = now_ms(); cmdSeen = true;
}

static THD_WORKING_AREA(waCanRx, 768);
static THD_FUNCTION(canRxThread, arg) {
  (void)arg;
  chRegSetThreadName("can rx");
  CANRxFrame rx;
  while (true) {
    if (canReceiveTimeout(&CAND1, CAN_ANY_MAILBOX, &rx, TIME_MS2I(50)) != MSG_OK) continue;
    live.canRxCount++;
    if (rx.RTR) continue;
    uint32_t id = rx.IDE ? rx.EID : rx.SID;
    if ((bool)rx.IDE == (bool)cfg.canExtendedId && id >= cfg.canRxBaseId && id <= cfg.canRxBaseId + 4U) {
      decode_cmd(id - cfg.canRxBaseId, rx.data8, rx.DLC);
    } else if (cfg.canEcuProtocol == 1 && !rx.IDE && id >= cfg.canEcuBaseId && id <= cfg.canEcuBaseId + 11U && rx.DLC == 8) {
      decode_ecu(id - cfg.canEcuBaseId, rx.data8);
    }
  }
}

/* Bit timing, pins, driver and the two CAN threads. Bitrate and listen-only are only read here. */
void can_init(void) {
  /* APB1 = 42 MHz, 14 time quanta per bit: sync 1 + BS1 11 + BS2 2 (sample point 85.7 %) */
  static const uint16_t brp[4] = { 24, 12, 6, 3 };
  uint8_t br = cfg.canBitrate > 3 ? 2 : cfg.canBitrate;
  canCfg.mcr = CAN_MCR_ABOM | CAN_MCR_AWUM | CAN_MCR_TXFP;
  canCfg.btr = CAN_BTR_SJW(0) | CAN_BTR_TS2(1) | CAN_BTR_TS1(10) | CAN_BTR_BRP(brp[br] - 1U);
  if (cfg.canListenOnly) canCfg.btr |= CAN_BTR_SILM;
  palSetPadMode(GPIOB, 8, PAL_MODE_ALTERNATE(9) | PAL_STM32_PUPDR_PULLUP);
  palSetPadMode(GPIOB, 9, PAL_MODE_ALTERNATE(9) | PAL_STM32_OSPEED_HIGHEST);
  canStart(&CAND1, &canCfg);
  chBSemObjectInit(&txSem, true);
  chThdCreateStatic(waCanTx, sizeof(waCanTx), NORMALPRIO + 1, canTxThread, NULL);
  chThdCreateStatic(waCanRx, sizeof(waCanRx), NORMALPRIO + 1, canRxThread, NULL);
}

static bool due(uint16_t *acc, uint8_t hz) {      /* called at 100 Hz */
  if (hz == 0) return false;
  *acc = (uint16_t)(*acc + hz);
  if (*acc >= 100) { *acc = (uint16_t)(*acc - 100); if (*acc >= 100) *acc = 0; return true; }
  return false;
}

/* Called every 10 ms: timeouts, receive rate statistics, and queues the frames that are due. */
void can_tx_update(void) {
  static uint16_t accAn, accAnVal, accEgt, accFq, accFq2, accDi, accAct;
  static uint8_t rateTick;
  uint32_t t = now_ms();
  bool be = cfg.canBigEndian;
  uint8_t d[8];

  live.ecuAlive = ecuSeen && (t - lastEcuMs) < (cfg.canEcuTimeoutMs ? cfg.canEcuTimeoutMs : 500U);
  live.cmdAlive = cmdSeen && (t - lastCmdMs) < (cfg.canCmdTimeoutMs ? cfg.canCmdTimeoutMs : 500U);
  live.canBusOff = (CAN1->ESR & CAN_ESR_BOFF) != 0;
  if (++rateTick >= 100) {                  /* once per second: how fast the ECU frames arrive */
    rateTick = 0;
    uint32_t total = 0;
    for (int i = 0; i < 12; i++) {
      uint16_t c = ecuCount[i]; ecuCount[i] = 0;
      live.ecuFrameRateN[i] = c > 255 ? 255 : (uint8_t)c;
      total += c;
    }
    live.ecuFrameRate = total > 65535U ? 65535U : (uint16_t)total;
  }
  if (cfg.canListenOnly) return;

  uint8_t di = status_di_bits();
  bool diChanged = cfg.canSendOnChange && di != lastDi;
  lastDi = di;
  if (due(&accDi, cfg.canRateDigital) || diChanged) {
    uint32_t b = status_bits();
    if (be) { d[0] = (uint8_t)(b >> 24); d[1] = (uint8_t)(b >> 16); d[2] = (uint8_t)(b >> 8); d[3] = (uint8_t)b; }
    else { d[0] = (uint8_t)b; d[1] = (uint8_t)(b >> 8); d[2] = (uint8_t)(b >> 16); d[3] = (uint8_t)(b >> 24); }
    d[4] = di; d[5] = status_an_switch_bits();
    wr16(d + 6, status_out_bits(), be);
    send(0, d);
  }
  if (due(&accAnVal, cfg.canRateAnalogValue)) {
    for (int f = 0; f < 2; f++) {
      for (int i = 0; i < 4; i++) {
        int ch = f * 4 + i;
        wr16(d + i * 2, sat_s16(live.anValue[ch] * scale_of(CFG_AN(&cfg, ch)->canScale)), be);
      }
      send(1U + (uint32_t)f, d);
    }
  }
  if (due(&accAn, cfg.canRateAnalog)) {
    for (int f = 0; f < 2; f++) {
      for (int i = 0; i < 4; i++) wr16(d + i * 2, sat_u16(live.anVolts[f * 4 + i] * 1000.0f), be);
      send(3U + (uint32_t)f, d);
    }
  }
  if (due(&accEgt, cfg.canRateEgt)) {
    for (int i = 0; i < 4; i++) wr16(d + i * 2, sat_s16(live.egt[i] * 10.0f), be);
    send(5, d);
    wr16(d, sat_s16(live.egt[4] * 10.0f), be); wr16(d + 2, sat_s16(live.egt[5] * 10.0f), be);
    wr16(d + 4, sat_s16(live.egtMax * 10.0f), be); wr16(d + 6, sat_s16(live.egtSpread * 10.0f), be);
    send(6, d);
  }
  float s1[N_FQ], s2[N_FQ];
  for (int i = 0; i < N_FQ; i++) {
    const fq_cfg_t *c = CFG_FQ(&cfg, i);
    bool preset = c->mode == 4 || c->mode == 7 || c->mode == 8 || (c->mode == 9 && c->sentType != 2);
    s1[i] = preset ? 10.0f : scale_of(c->canScale);
    s2[i] = preset ? 10.0f : scale_of(c->canScale2);
  }
  if (due(&accFq, cfg.canRateFreq)) {
    for (int i = 0; i < 4; i++) wr16(d + i * 2, sat_u16(live.fqValue[i] * s1[i]), be);
    send(7, d);
    wr16(d, sat_u16(live.fqValue[4] * s1[4]), be); wr16(d + 2, sat_u16(live.vbatt * 1000.0f), be);
    wr16(d + 4, sat_u16(live.v5 * 1000.0f), be); wr16(d + 6, sat_s16(live.mcuTemp * 10.0f), be);
    send(8, d);
  }
  if (due(&accFq2, cfg.canRateFreq2)) {
    for (int i = 0; i < 4; i++) wr16(d + i * 2, sat_s16(live.fqValue2[i] * s2[i]), be);
    send(10, d);
    wr16(d, sat_s16(live.fqValue2[4] * s2[4]), be); wr16(d + 2, sat_s16(live.actPosition2 * 100.0f), be);
    wr16(d + 4, sat_s16(live.actPosDiff * 100.0f), be); d[6] = status_bits2(); d[7] = 0;
    send(11, d);
  }
  if (cfg.act_mode != 0 && due(&accAct, cfg.canRateActuator)) {
    wr16(d, sat_s16(live.actPosition * 100.0f), be); wr16(d + 2, sat_s16(live.actTarget * 100.0f), be);
    wr16(d + 4, sat_s16(live.actDuty * 100.0f), be);
    d[6] = (uint8_t)((live.actEnabled ? 1 : 0) | (live.actFault ? 2 : 0) | (live.actMismatch ? 4 : 0) | (live.actCalibrating ? 8 : 0) | (live.actAutotuning ? 16 : 0));
    d[7] = 0;
    send(9, d);
  }
}
