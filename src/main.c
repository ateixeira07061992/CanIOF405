/*
 * CAN IO expander for the WeAct STM32F405RG core board - main loop.
 * ChibiOS RT + HAL. Structure and protocols follow the rusEFI firmware (GPL v3).
 */
#include "canio.h"


live_t live;

#define DFU_MAGIC_ADDR ((volatile uint32_t *)0x2001FFF0U)
#define DFU_MAGIC      0xB00710ADU

static volatile uint8_t resetRequest;      /* 1 reset, 2 reset into the ROM bootloader (DFU) */

void request_reset(bool dfu) { resetRequest = dfu ? 2 : 1; }

/* Stops the bridge, drops USB and resets. For DFU a magic word is left in RAM for board.c to find. */
static void do_reset(void) {
  act_inhibit(true);
  chThdSleepMilliseconds(200);             /* lets TunerStudio get its answer */
  usbDisconnectBus(&USBD1);
  chThdSleepMilliseconds(300);
  chSysDisable();
  if (resetRequest == 2) *DFU_MAGIC_ADDR = DFU_MAGIC;
  NVIC_SystemReset();
}

/* Hardware watchdog: LSI 32 kHz / 64 = 500 Hz, reload 2500 = 5 s.
 * It has to be longer than a configuration burn, which stalls the CPU for 1 to 2 s while the flash sector is erased. */
static const WDGConfig wdgCfg = { .pr = STM32_IWDG_PR_64, .rlr = STM32_IWDG_RL(2500) };

int main(void) {
  halInit();
  chSysInit();
  wdgStart(&WDGD1, &wdgCfg);

  palSetPadMode(GPIOB, 2, PAL_MODE_OUTPUT_PUSHPULL);      /* LED on the WeAct board */
  crc32_init();
  storage_init();
  config_load();

  analog_init();
  di_init();
  freq_init();
  out_init();
  act_init();
  can_init();
  ts_start();

  systime_t next = chVTGetSystemTime();
  uint32_t tick = 0;
  while (true) {
    next += TIME_MS2I(1);
    chThdSleepUntil(next);
    tick++;
    wdgReset(&WDGD1);
    di_update();
    if (tick % 10U == 0U) {
      analog_update();
      freq_update();
      status_update();
      out_update();
      can_tx_update();
      cal_update();
    }
    if (tick % 1000U == 0U) { live.uptime++; ts_rate_update(); }
    /* LED: slow blink = running, fast blink = fault or configuration error */
    uint32_t half = (live.configError || status_bits() != 0U) ? 100U : 500U;
    palWritePad(GPIOB, 2, ((tick / half) & 1U) ? 1U : 0U);
    if (resetRequest) do_reset();
  }
}
