/*
 * H-bridge position actuator (electronic wastegate or compressor bypass valve), TLE9201SG.
 *   PWM = PB14 (TIM12 CH1)   DIR = PB15   DIS = PB13 (high = bridge off)
 *
 * Follows the rusEFI electronic throttle code:
 *   - closed loop PID on a position sensor
 *   - optional second sensor, with the "second sensor saturates early" mode of RedundantFordTps
 *   - auto calibration of the sensor end stops
 *   - relay PID autotune, same maths as EtbController::autotune (Ziegler-Nichols, "some overshoot" rule)
 * Calibration and autotune results go back to TunerStudio through cal_report().
 */
#include "canio.h"

static PWMConfig pwmH = { .frequency = 4000000, .period = 4000,
  .channels = { { PWM_OUTPUT_ACTIVE_HIGH, NULL }, { PWM_OUTPUT_DISABLED, NULL }, { PWM_OUTPUT_DISABLED, NULL }, { PWM_OUTPUT_DISABLED, NULL } } };

enum { ST_RUN, ST_CAL_OPEN, ST_CAL_CLOSE, ST_TUNE };
static volatile uint8_t state = ST_RUN;
static volatile uint8_t request = 0xFF;
static volatile bool inhibit;

static float integral, prevError;
static uint32_t errorMs, diffMs, stateMs;
static bool latched;

/* autotune */
static bool  tuneHigh;
static float tuneMax, tuneMin, tuneSumA, tuneSumTu;
static uint32_t tuneLastCross;
static uint8_t tuneCount;

static void bridge(float duty) {            /* duty -100..100, positive = opening */
  bool off = inhibit || duty == 0.0f;
  live.actDuty = duty;
  if (cfg.act_invertDir) duty = -duty;
  float mag = clampf(fabsf(duty), 0.0f, 100.0f);
  palWritePad(GPIOB, 15, duty >= 0.0f ? 1U : 0U);
  pwmEnableChannel(&PWMD12, 0, PWM_PERCENTAGE_TO_WIDTH(&PWMD12, (uint32_t)(mag * 100.0f)));
  palWritePad(GPIOB, 13, off ? 1U : 0U);
}

/* Disables the bridge and clears the PID memory. */
static void bridge_off(void) {
  live.actDuty = 0.0f;
  palSetPad(GPIOB, 13);
  pwmEnableChannel(&PWMD12, 0, 0);
  integral = 0.0f; prevError = 0.0f;
}

/* Sensor voltage to travel in percent, from the closed / open calibration voltages. */
static float pct(float v, float closedV, float openV) {
  float span = openV - closedV;
  if (fabsf(span) < 0.05f) return 0.0f;
  return (v - closedV) * 100.0f / span;
}

/* Reads the position sensors. Returns false on a sensor fault. */
static bool read_position(uint32_t dtMs) {
  if (cfg.act_posChannel < 1 || cfg.act_posChannel > N_AN) return false;
  float v1 = live.anVolts[cfg.act_posChannel - 1];
  bool ok = v1 >= cfg.act_sensorMinV && v1 <= cfg.act_sensorMaxV;
  float p1 = pct(v1, cfg.act_closedV, cfg.act_openV);
  live.actPosVolts = v1;
  float pos = p1;
  live.actPosVolts2 = 0.0f; live.actPosition2 = 0.0f; live.actPosDiff = 0.0f;

  bool second = cfg.act_posChannel2 >= 1 && cfg.act_posChannel2 <= N_AN && cfg.act_posChannel2 != cfg.act_posChannel;
  if (second) {
    float v2 = live.anVolts[cfg.act_posChannel2 - 1];
    float p2 = pct(v2, cfg.act_closedV2, cfg.act_openV2);
    bool compare = true;
    if (cfg.act_redundancy == 1) {
      /* the second sensor covers 0..100 % of its own range in the first secondaryMaximum % of travel */
      p2 = p2 * cfg.act_secondaryMaximum / 100.0f;
      if (p1 > 0.9f * cfg.act_secondaryMaximum) compare = false;       /* saturated: trust the first sensor */
    } else if (cfg.act_redundancy == 2) {
      compare = false;
    }
    live.actPosVolts2 = v2; live.actPosition2 = p2; live.actPosDiff = p1 - p2;
    if (compare && state == ST_RUN) {
      if (v2 < cfg.act_sensorMinV || v2 > cfg.act_sensorMaxV) ok = false;
      if (fabsf(p1 - p2) > cfg.act_maxSensorDiff) {
        diffMs += dtMs;
        if (diffMs >= cfg.act_sensorDiffTimeMs) live.actMismatch = true;
      } else {
        diffMs = 0;
        if (!latched) live.actMismatch = false;
      }
      if (!live.actMismatch) pos = (p1 + p2) * 0.5f;
    }
  } else {
    live.actMismatch = false;
  }
  live.actPosition = pos;
  return ok;
}

/* Returns false when the bridge must stay off (not commanded). */
static bool read_target(float *target) {
  bool table = false;
  switch (cfg.act_targetSource) {
  case 0:
    if (live.cmdAlive) {
      if (!live.cmdActEnable) return false;
      *target = live.cmdActTarget;
    } else if (cfg.act_failsafe == 1) {
      *target = cfg.act_failsafePos;
    } else if (cfg.act_failsafe == 2) {
      table = true;
    } else {
      return false;
    }
    break;
  case 1: table = true; break;
  default: *target = cfg.act_fixedTarget; break;
  }
  if (table) {
    bool fx, fy;
    float x = axis_value(cfg.act_axisX, &fx), y = axis_value(cfg.act_axisY, &fy);
    live.actAxisX = x; live.actAxisY = y;
    if (fx || fy) return false;
    *target = table8x8(cfg.act_xBins, cfg.act_yBins, cfg.act_table, x, y) * 0.5f;
  }
  *target = clampf(*target, 0.0f, 100.0f);
  return true;
}

/* Normal closed loop: target, safety checks, PID. */
static void run(uint32_t dtMs, bool sensorOk) {
  float dt = (float)dtMs / 1000.0f;
  float target = 0.0f;
  bool want = read_target(&target);
  live.actTarget = want ? target : 0.0f;

  if (!want) latched = false;                 /* dropping the command clears a latched fault */
  if (!sensorOk || live.actMismatch) latched = true;
  if (!want || latched || live.configError) {
    live.actFault = latched;
    live.actEnabled = false;
    live.actError = 0.0f;
    errorMs = 0;
    bridge_off();
    return;
  }

  float error = target - live.actPosition;
  live.actError = error;
  if (fabsf(error) > cfg.act_maxError) {
    errorMs += dtMs;
    if (errorMs >= cfg.act_errorTimeMs) { latched = true; live.actFault = true; bridge_off(); return; }
  } else {
    errorMs = 0;
  }

  float e = fabsf(error) < cfg.act_deadband ? 0.0f : error;
  integral = clampf(integral + cfg.act_iFactor * e * dt, -cfg.act_iLimit, cfg.act_iLimit);
  float d = cfg.act_dFactor * (error - prevError) / dt;
  prevError = error;
  float out = cfg.act_offset + cfg.act_pFactor * e + integral + d;
  out = clampf(out, cfg.act_minDuty, cfg.act_maxDuty);
  if (out == 0.0f) out = 0.01f;               /* keep the bridge enabled (brake) */
  live.actFault = false;
  live.actEnabled = true;
  bridge(out);
}

/* Auto calibration state machine: finds the open and closed sensor voltages. */
static void calibrate(uint32_t now) {
  /* 1 s against each end stop at half duty, value sampled at the end (rusEFI autoCalibrateTps does the same) */
  float duty = clampf(50.0f, 0.0f, cfg.act_maxDuty);
  bool second = cfg.act_posChannel2 >= 1 && cfg.act_posChannel2 <= N_AN;
  if (state == ST_CAL_OPEN) {
    bridge(duty);
    if (now - stateMs >= 1000U) {
      cfg.act_openV = live.actPosVolts; cal_report(2, cfg.act_openV);
      if (second) { cfg.act_openV2 = live.actPosVolts2; cal_report(4, cfg.act_openV2); }
      state = ST_CAL_CLOSE; stateMs = now;
    }
  } else {
    bridge(clampf(-50.0f, cfg.act_minDuty, 0.0f));
    if (now - stateMs >= 1000U) {
      cfg.act_closedV = live.actPosVolts; cal_report(1, cfg.act_closedV);
      if (second) { cfg.act_closedV2 = live.actPosVolts2; cal_report(3, cfg.act_closedV2); }
      bridge_off();
      live.actCalibrating = false; live.needBurn = true;
      state = ST_RUN;
    }
  }
}

static void tune_stop(void) {
  bridge_off();
  live.actAutotuning = false;
  state = ST_RUN;
}

/* Relay autotune: bang-bang around the centre position, measures the oscillation amplitude (a) and period (Tu),
 * then Ku = 4 b / (pi a), P = 0.35 Ku, I = 0.25 Ku / Tu, D = 0.08 Ku Tu, as rusEFI does for the throttle. */
static void tune(uint32_t now) {
  float pos = live.actPosition;
  float b = cfg.act_tuneAmplitude;
  if (pos > tuneMax) tuneMax = pos;
  if (pos < tuneMin) tuneMin = pos;
  bool high = pos > cfg.act_tuneCenter;

  if (high != tuneHigh) {
    tuneHigh = high;
    if (!high) {                              /* one full cycle ends each time the position falls through the centre */
      if (tuneLastCross != 0) {
        float tu = (float)(now - tuneLastCross) / 1000.0f;
        float a = (tuneMax - tuneMin) * 0.5f;
        if (tuneCount > 0 && a > 0.1f) {      /* the first cycle is discarded */
          tuneSumA += a; tuneSumTu += tu;
          float n = (float)tuneCount;
          float ku = 4.0f * b / (3.14159265f * (tuneSumA / n));
          float tuAvg = tuneSumTu / n;
          live.actTuneKu = ku; live.actTuneTu = tuAvg;
          live.actTuneP = 0.35f * ku;
          live.actTuneI = 0.25f * ku / tuAvg;
          live.actTuneD = 0.08f * ku * tuAvg;
        }
        tuneCount++;
        if (tuneCount > cfg.act_tuneCycles && tuneSumTu > 0.0f) {
          cfg.act_pFactor = live.actTuneP; cfg.act_iFactor = live.actTuneI; cfg.act_dFactor = live.actTuneD;
          cal_report(5, cfg.act_pFactor); cal_report(6, cfg.act_iFactor); cal_report(7, cfg.act_dFactor);
          live.needBurn = true;
          tune_stop();
          return;
        }
      }
      tuneLastCross = now;
      tuneMax = pos; tuneMin = pos;
    }
  }
  if (now - stateMs > 30000U || latched) { tune_stop(); return; }      /* never oscillates: give up */
  bridge(clampf(cfg.act_offset + (high ? -b : b), cfg.act_minDuty, cfg.act_maxDuty));
}

static THD_WORKING_AREA(waAct, 1024);
static THD_FUNCTION(actThread, arg) {
  (void)arg;
  chRegSetThreadName("actuator");
  systime_t next = chVTGetSystemTime();
  while (true) {
    uint32_t dt = cfg.act_periodMs ? cfg.act_periodMs : 2U;
    next += TIME_MS2I(dt);
    chThdSleepUntil(next);
    uint32_t now = now_ms();

    uint8_t rq = request; request = 0xFF;
    bool usable = cfg.act_mode != 0 && !inhibit && cfg.act_posChannel >= 1 && cfg.act_posChannel <= N_AN;
    if (rq == 1 || rq == 3) {                 /* stop: also clears a latched fault */
      state = ST_RUN; latched = false; live.actMismatch = false;
      live.actCalibrating = live.actAutotuning = false;
      bridge_off();
    } else if (rq == 0 && usable) {
      state = ST_CAL_OPEN; stateMs = now; live.actCalibrating = true;
    } else if (rq == 2 && usable) {
      state = ST_TUNE; stateMs = now; live.actAutotuning = true; latched = false;
      tuneHigh = live.actPosition > cfg.act_tuneCenter;
      tuneMax = tuneMin = live.actPosition; tuneSumA = tuneSumTu = 0.0f; tuneLastCross = 0; tuneCount = 0;
    }

    if (!usable) {
      state = ST_RUN;
      live.actEnabled = live.actCalibrating = live.actAutotuning = false;
      live.actFault = false; live.actMismatch = false; latched = false;
      live.actPosition = live.actTarget = live.actError = 0.0f;
      bridge_off();
      continue;
    }
    bool ok = read_position(dt);
    switch (state) {
    case ST_CAL_OPEN:
    case ST_CAL_CLOSE: live.actEnabled = true; calibrate(now); break;
    case ST_TUNE:
      if (!ok) { latched = true; live.actFault = true; tune_stop(); break; }
      live.actEnabled = true; live.actTarget = cfg.act_tuneCenter; tune(now); break;
    default: run(dt, ok); break;
    }
  }
}

void act_command(int index) { if (index >= 0 && index <= 3) request = (uint8_t)index; }

/* Forces the bridge off (used while the configuration is burned and before a reset). */
void act_inhibit(bool on) {
  inhibit = on;
  if (on) palSetPad(GPIOB, 13);
}

/* Pins, PWM timer and control thread. The PWM frequency is only read here (restart to change). */
void act_init(void) {
  palSetPad(GPIOB, 13);                        /* bridge disabled */
  palSetPadMode(GPIOB, 13, PAL_MODE_OUTPUT_PUSHPULL);
  palClearPad(GPIOB, 15);
  palSetPadMode(GPIOB, 15, PAL_MODE_OUTPUT_PUSHPULL);
  uint32_t hz = cfg.act_pwmFreq < 100 ? 100U : cfg.act_pwmFreq;
  pwmH.period = (pwmcnt_t)(4000000U / hz);
  pwmStart(&PWMD12, &pwmH);
  pwmEnableChannel(&PWMD12, 0, 0);
  palSetPadMode(GPIOB, 14, PAL_MODE_ALTERNATE(9));
  chThdCreateStatic(waAct, sizeof(waAct), NORMALPRIO + 2, actThread, NULL);
}
