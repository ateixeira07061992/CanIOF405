/* Digital inputs DI1..DI4 = PC13, PD2, PB12, PB4. Debounced at 1 kHz. (PC10 / PC11 are the serial port.) */
#include "canio.h"

static const struct { ioportid_t port; uint8_t pad; } diPin[N_DI] = {
  { GPIOC, 13 }, { GPIOD, 2 }, { GPIOB, 12 }, { GPIOB, 4 },
};
static uint8_t counter[N_DI];
static bool raw[N_DI];

void di_init(void) {
  for (int i = 0; i < N_DI; i++) {
    const di_cfg_t *d = CFG_DI(&cfg, i);
    iomode_t mode = (d->pull == 1) ? PAL_MODE_INPUT_PULLUP : (d->pull == 2) ? PAL_MODE_INPUT_PULLDOWN : PAL_MODE_INPUT;
    palSetPadMode(diPin[i].port, diPin[i].pad, mode);
  }
}

void di_update(void) {
  for (int i = 0; i < N_DI; i++) {
    const di_cfg_t *d = CFG_DI(&cfg, i);
    if (!d->enable) {
      live.di[i] = false; counter[i] = 0;
      continue;
    }
    bool level = palReadPad(diPin[i].port, diPin[i].pad) != 0;
    if (level != raw[i]) {
      if (++counter[i] >= d->debounce) {
        raw[i] = level;
        counter[i] = 0;
      }
    } else {
      counter[i] = 0;
    }
    live.di[i] = raw[i] != (d->invert != 0);
  }
}
