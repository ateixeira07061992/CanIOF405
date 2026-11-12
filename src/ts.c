/*
 * TunerStudio binary protocol over USB CDC.
 * Framing and command set follow the rusEFI firmware (firmware/console/binary/tunerstudio.cpp, GPL):
 *   request : [u16 BE length][command + payload][u32 BE CRC32 of command + payload]
 *   response: [u16 BE length][response code + payload][u32 BE CRC32 of code + payload]
 * Plain (unframed) 'S' / 'Q' return the signature and 'F' the protocol version, as rusEFI does for port detection.
 *
 * Two identical ports run the same protocol: USB CDC, and UART4 (PC10 TX, PC11 RX) for a Bluetooth serial module.
 */
#include "canio.h"
#include "portab.h"
#include "usbcfg.h"

#define TS_RESPONSE_OK              0x00
#define TS_RESPONSE_BURN_OK         0x04
#define TS_RESPONSE_UNDERRUN        0x80
#define TS_RESPONSE_CRC_FAILURE     0x82
#define TS_RESPONSE_UNRECOGNIZED    0x83
#define TS_RESPONSE_OUT_OF_RANGE    0x84

typedef struct {
  BaseChannel *chn;
  uint8_t rx[600];
  uint8_t och[OUTPUT_BLOCK_SIZE];
  volatile uint16_t reads;          /* output channel reads since the last rate update */
  bool usb;
} ts_port_t;

static ts_port_t portUsb = { .usb = true }, portSerial;
static MUTEX_DECL(tsMutex);         /* one command at a time: both ports edit the same configuration */

static inline uint16_t le16(const uint8_t *p) { return (uint16_t)(p[0] | (p[1] << 8)); }
static inline uint16_t be16(const uint8_t *p) { return (uint16_t)((p[0] << 8) | p[1]); }

static void ts_send(ts_port_t *c, uint8_t code, const uint8_t *data, size_t n) {
  BaseChannel *chn = c->chn;
  uint8_t hdr[3] = { (uint8_t)((n + 1) >> 8), (uint8_t)(n + 1), code };
  uint32_t crc = crc32(&hdr[2], 1);
  if (n) {
    crc = crc32_inc(data, crc, n);
  }
  uint8_t tail[4] = { (uint8_t)(crc >> 24), (uint8_t)(crc >> 16), (uint8_t)(crc >> 8), (uint8_t)crc };
  chnWriteTimeout(chn, hdr, 3, TIME_MS2I(200));
  if (n) {
    chnWriteTimeout(chn, data, n, TIME_MS2I(500));
  }
  chnWriteTimeout(chn, tail, 4, TIME_MS2I(200));
}

static bool range_ok(uint32_t offset, uint32_t count, uint32_t total) {
  return offset <= total && count <= total && offset + count <= total;
}

static void ts_command(uint16_t subsystem, uint16_t index) {
  switch (subsystem) {
  case 0x10: out_test(index, 1); break;
  case 0x11: out_test(index, 0); break;
  case 0x12: out_test(index, -1); break;
  case 0x20: act_command(index); break;
  case 0x30: config_defaults(); live.needBurn = true; break;
  case 0xBB: request_reset(false); break;
  case 0xBA: request_reset(true); break;
  default: break;
  }
}

static void ts_handle(ts_port_t *c, uint8_t *p, size_t size) {
  uint8_t cmd = p[0];
  uint8_t *d = p + 1;
  size_t n = size - 1;

  switch (cmd) {
  case 'O': {
    uint16_t offset = 0, count = OUTPUT_BLOCK_SIZE;
    if (n >= 4) { offset = le16(d); count = le16(d + 2); }
    if (!range_ok(offset, count, OUTPUT_BLOCK_SIZE)) { ts_send(c, TS_RESPONSE_OUT_OF_RANGE, NULL, 0); break; }
    outputs_pack(c->och);
    c->reads++;
    ts_send(c, TS_RESPONSE_OK, c->och + offset, count);
    break;
  }
  case 'R': {
    if (n < 6) { ts_send(c, TS_RESPONSE_UNDERRUN, NULL, 0); break; }
    uint16_t offset = le16(d + 2), count = le16(d + 4);
    if (le16(d) != 0 || !range_ok(offset, count, CONFIG_PAGE_SIZE)) { ts_send(c, TS_RESPONSE_OUT_OF_RANGE, NULL, 0); break; }
    ts_send(c, TS_RESPONSE_OK, (const uint8_t *)&cfg + offset, count);
    break;
  }
  case 'C': {
    if (n < 6) { ts_send(c, TS_RESPONSE_UNDERRUN, NULL, 0); break; }
    uint16_t offset = le16(d + 2), count = le16(d + 4);
    if (le16(d) != 0 || !range_ok(offset, count, CONFIG_PAGE_SIZE)) { ts_send(c, TS_RESPONSE_OUT_OF_RANGE, NULL, 0); break; }
    if (n < 6U + count) { ts_send(c, TS_RESPONSE_UNDERRUN, NULL, 0); break; }
    memcpy((uint8_t *)&cfg + offset, d + 6, count);
    live.needBurn = true;
    ts_send(c, TS_RESPONSE_OK, NULL, 0);
    break;
  }
  case 'W': {
    if (n < 5) { ts_send(c, TS_RESPONSE_UNDERRUN, NULL, 0); break; }
    uint16_t offset = le16(d + 2);
    uint16_t count = (uint16_t)(n - 4);
    if (le16(d) != 0 || !range_ok(offset, count, CONFIG_PAGE_SIZE)) { ts_send(c, TS_RESPONSE_OUT_OF_RANGE, NULL, 0); break; }
    memcpy((uint8_t *)&cfg + offset, d + 4, count);
    live.needBurn = true;
    ts_send(c, TS_RESPONSE_OK, NULL, 0);
    break;
  }
  case 'k': {
    if (n < 6) { ts_send(c, TS_RESPONSE_UNDERRUN, NULL, 0); break; }
    uint16_t offset = le16(d + 2), count = le16(d + 4);
    if (le16(d) != 0 || !range_ok(offset, count, CONFIG_PAGE_SIZE)) { ts_send(c, TS_RESPONSE_OUT_OF_RANGE, NULL, 0); break; }
    uint32_t crc = crc32((const uint8_t *)&cfg + offset, count);
    uint8_t out[4] = { (uint8_t)(crc >> 24), (uint8_t)(crc >> 16), (uint8_t)(crc >> 8), (uint8_t)crc };
    ts_send(c, TS_RESPONSE_OK, out, 4);
    break;
  }
  case 'B':
    if (config_burn()) {
      ts_send(c, TS_RESPONSE_BURN_OK, NULL, 0);
    } else {
      ts_send(c, TS_RESPONSE_OUT_OF_RANGE, NULL, 0);
    }
    break;
  case 'S':
  case 'Q':
    ts_send(c, TS_RESPONSE_OK, (const uint8_t *)TS_SIGNATURE, sizeof(TS_SIGNATURE));
    break;
  case 'V':
    ts_send(c, TS_RESPONSE_OK, (const uint8_t *)FW_VERSION_STRING, sizeof(FW_VERSION_STRING));
    break;
  case 'e':
    ts_send(c, TS_RESPONSE_OK, (const uint8_t *)live.configErrorMsg, strlen(live.configErrorMsg));
    break;
  case 'Z':
    if (n >= 4) {
      ts_command(be16(d), be16(d + 2));
    }
    ts_send(c, TS_RESPONSE_OK, NULL, 0);
    break;
  default:
    ts_send(c, TS_RESPONSE_UNRECOGNIZED, NULL, 0);
    break;
  }
}

static THD_WORKING_AREA(waTsUsb, 2048);
static THD_WORKING_AREA(waTsSerial, 2048);
static THD_FUNCTION(tsThread, arg) {
  ts_port_t *c = (ts_port_t *)arg;
  BaseChannel *chn = c->chn;
  uint8_t *rx = c->rx;
  chRegSetThreadName(c->usb ? "ts usb" : "ts serial");

  while (true) {
    uint8_t first, second;
    if (c->usb && SDU1.config->usbp->state != USB_ACTIVE) {
      chThdSleepMilliseconds(100);
      continue;
    }
    if (chnReadTimeout(chn, &first, 1, TIME_MS2I(200)) != 1) {
      continue;
    }
    if (first == 'S' || first == 'Q') {
      chnWriteTimeout(chn, (const uint8_t *)TS_SIGNATURE, sizeof(TS_SIGNATURE), TIME_MS2I(200));
      continue;
    }
    if (first == 'F') {
      chnWriteTimeout(chn, (const uint8_t *)"001", 3, TIME_MS2I(200));
      continue;
    }
    if (chnReadTimeout(chn, &second, 1, TIME_MS2I(100)) != 1) {
      continue;
    }
    size_t size = ((size_t)first << 8) | second;
    if (size == 0 || size + 4 > sizeof(c->rx)) {
      ts_send(c, TS_RESPONSE_OUT_OF_RANGE, NULL, 0);
      continue;
    }
    if (chnReadTimeout(chn, rx, size + 4, TIME_MS2I(500)) != size + 4) {
      ts_send(c, TS_RESPONSE_UNDERRUN, NULL, 0);
      continue;
    }
    uint32_t expected = ((uint32_t)rx[size] << 24) | ((uint32_t)rx[size + 1] << 16) | ((uint32_t)rx[size + 2] << 8) | rx[size + 3];
    if (expected != crc32(rx, size)) {
      ts_send(c, TS_RESPONSE_CRC_FAILURE, NULL, 0);
      continue;
    }
    chMtxLock(&tsMutex);
    ts_handle(c, rx, size);
    chMtxUnlock(&tsMutex);
  }
}

void ts_rate_update(void) {
  uint16_t a = portUsb.reads; portUsb.reads = 0;
  uint16_t b = portSerial.reads; portSerial.reads = 0;
  live.tsRate[0] = a > 255 ? 255 : (uint8_t)a;
  live.tsRate[1] = b > 255 ? 255 : (uint8_t)b;
}

/*
 * Values the firmware wants TunerStudio to write back into the tune (auto calibration, PID autotune).
 * Same mechanism as rusEFI: calibrationMode / calibrationValue output channels and maintainConstantValue in the ini.
 * Each value is shown for 600 ms, then the mode returns to 0 for 200 ms.
 */
#define CAL_QUEUE 8
static struct { uint8_t mode; float value; } calQueue[CAL_QUEUE];
static volatile uint8_t calHead, calTail;
static uint16_t calTimer;

void cal_report(uint8_t mode, float value) {
  uint8_t next = (uint8_t)((calHead + 1) % CAL_QUEUE);
  if (next != calTail) {
    calQueue[calHead].mode = mode;
    calQueue[calHead].value = value;
    calHead = next;
  }
}

void cal_update(void) {      /* called at 100 Hz */
  if (calTimer > 0) {
    calTimer--;
    if (calTimer == 20) {
      live.calibrationMode = 0;
    }
    return;
  }
  if (calTail != calHead) {
    live.calibrationValue = calQueue[calTail].value;
    live.calibrationMode = calQueue[calTail].mode;
    calTail = (uint8_t)((calTail + 1) % CAL_QUEUE);
    calTimer = 80;
  }
}

static SerialConfig serialCfg;

void ts_start(void) {
  /* serial port for a Bluetooth module: UART4, PC10 = TX, PC11 = RX */
  static const uint32_t bauds[] = { 9600, 19200, 38400, 57600, 115200, 230400 };
  serialCfg.speed = bauds[cfg.serialBaud < 6 ? cfg.serialBaud : 4];
  palSetPadMode(GPIOC, 10, PAL_MODE_ALTERNATE(8));
  palSetPadMode(GPIOC, 11, PAL_MODE_ALTERNATE(8) | PAL_STM32_PUPDR_PULLUP);
  sdStart(&SD4, &serialCfg);
  portSerial.chn = (BaseChannel *)&SD4;
  chThdCreateStatic(waTsSerial, sizeof(waTsSerial), NORMALPRIO - 1, tsThread, &portSerial);

  sduObjectInit(&SDU1);
  sduStart(&SDU1, &serusbcfg);
  usbDisconnectBus(serusbcfg.usbp);
  chThdSleepMilliseconds(1000);
  usbStart(serusbcfg.usbp, &usbcfg);
  usbConnectBus(serusbcfg.usbp);
  portUsb.chn = (BaseChannel *)&SDU1;
  chThdCreateStatic(waTsUsb, sizeof(waTsUsb), NORMALPRIO - 1, tsThread, &portUsb);
}
