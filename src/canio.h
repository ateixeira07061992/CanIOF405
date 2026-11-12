/*
 * CAN IO expander for the WeAct STM32F405RG core board.
 * Shared definitions. The configuration and output channel layouts come from canio_layout.h,
 * which is generated together with the TunerStudio ini (gen_ini.py).
 *
 * The TunerStudio protocol handling follows the rusEFI firmware (GPL), see ts.c.
 */
#pragma once

#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#include "ch.h"
#include "hal.h"
#include "canio_layout.h"

#define N_AN   8
#define N_EGT  6
#define N_FQ   5
#define N_DI   4
#define N_OUT  10
#define N_PWM  6

#define FW_VERSION_STRING "canio-f405 fw 0.3"

/* Live state shared between the modules. Single 32 bit reads and writes are atomic on Cortex-M4. */
typedef struct {
  uint32_t uptime;

  /* analog */
  float anVolts[N_AN];
  float anValue[N_AN];
  bool  anFault[N_AN];
  bool  anSwitch[N_AN];
  float vbatt, v5, mcuTemp;

  /* EGT */
  float egtVolts[N_EGT];
  float egt[N_EGT];
  bool  egtFault[N_EGT];
  float egtMax, egtMin, egtAvg, egtSpread;
  bool  egtWarn, egtCrit, egtSpreadWarn;

  /* frequency / digital sensors */
  float fqHz[N_FQ];
  float fqValue[N_FQ];
  float fqValue2[N_FQ];
  bool  fqFault[N_FQ];

  /* digital inputs */
  bool di[N_DI];

  /* outputs */
  float outDuty[N_OUT];          /* 0..100 after polarity */
  bool  outState[N_OUT];
  float outAxisX[N_OUT], outAxisY[N_OUT];
  bool  faultOutActive;

  /* actuator */
  float actPosition, actPosition2, actTarget, actDuty, actError, actPosVolts, actPosVolts2, actPosDiff;
  bool  actFault, actMismatch, actCalibrating, actAutotuning, actEnabled;
  float actTuneKu, actTuneTu, actTuneP, actTuneI, actTuneD;
  float actAxisX, actAxisY;

  /* CAN */
  uint32_t canRxCount, canTxCount;
  uint16_t canErrCount;
  bool  canBusOff, ecuAlive, cmdAlive;
  float ecu[ECU_COUNT];          /* values decoded from the ECU broadcast, index = ECU_xxx from canio_layout.h */
  uint16_t ecuFrameRate;         /* ECU frames received in the last second */
  uint8_t  ecuFrameRateN[12];    /* same, per frame (base + n) */
  uint8_t  tsRate[2];            /* TunerStudio output channel reads per second: 0 USB, 1 serial */
  float canUser[4];
  uint16_t cmdOutBits;           /* bit n = output n+1 requested on */
  uint8_t  cmdPwmDuty[N_PWM];    /* 0.5 % per bit */
  float    cmdActTarget;
  bool     cmdActEnable;

  /* TunerStudio helpers */
  uint8_t calibrationMode;
  float   calibrationValue;
  bool    needBurn;
  bool    configError;
  bool    v5Fault, vbattLow;
  char    configErrorMsg[64];
} live_t;

extern config_t cfg;
extern live_t live;

/* util.c */
void     crc32_init(void);
uint32_t crc32_inc(const void *buf, uint32_t crc, size_t n);
static inline uint32_t crc32(const void *buf, size_t n) { return crc32_inc(buf, 0, n); }
float    clampf(float v, float lo, float hi);
float    interp(float x0, float y0, float x1, float y1, float x);
float    curve_lookup(const float *bins, const float *vals, int n, float x);
float    table8x8(const float *xb, const float *yb, const uint8_t *tbl, float x, float y);
static inline uint32_t now_ms(void) { return (uint32_t)TIME_I2MS(chVTGetSystemTimeX()); }

/* storage.c */
void storage_init(void);
bool config_load(void);
bool config_burn(void);
void config_defaults(void);

/* ts.c */
void ts_start(void);
void cal_report(uint8_t mode, float value);
void cal_update(void);
void ts_rate_update(void);          /* once per second */

/* analog.c */
void analog_init(void);
void analog_update(void);          /* 100 Hz */

/* freq.c */
void freq_init(void);
void freq_update(void);            /* 100 Hz */

/* dio.c */
void di_init(void);
void di_update(void);              /* 1 kHz */

/* outputs.c */
void  out_init(void);
void  out_update(void);            /* 100 Hz */
void  out_test(int index, int state);   /* state: 1 on, 0 off, -1 release; index 0 = all (release only) */
float axis_value(uint8_t source, bool *fault);

/* actuator.c */
void act_init(void);
void act_command(int index);       /* 0 auto calibrate, 1 stop, 2 autotune start, 3 autotune stop */
void act_inhibit(bool on);         /* used while the configuration is written to flash */

/* cancom.c */
void can_init(void);
void can_tx_update(void);          /* 100 Hz */

/* status.c */
void     status_update(void);      /* 100 Hz */
uint32_t status_bits(void);
uint8_t  status_bits2(void);
uint8_t  status_di_bits(void);
uint8_t  status_an_switch_bits(void);
uint16_t status_out_bits(void);
void     outputs_pack(uint8_t *block);  /* fills OUTPUT_BLOCK_SIZE bytes for TunerStudio */

/* main.c */
void request_reset(bool dfu);
