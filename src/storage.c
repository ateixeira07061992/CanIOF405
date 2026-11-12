/* Configuration storage in the last flash sector (sector 11, 128 KiB at 0x080E0000). */
#include "canio.h"

#define CFG_SECTOR  11U
#define CFG_MAGIC   0x43494F33U    /* "CIO3" */

typedef struct {
  uint32_t magic;
  uint32_t size;
  uint32_t crc;
} cfg_header_t;

config_t cfg;

void storage_init(void) {
  eflStart(&EFLD1, NULL);
}

void config_defaults(void) {
  memset(&cfg, 0, sizeof(cfg));
  config_generated_defaults(&cfg);
  /* option lists default to their first entry in the ini; these are the ones that need another value */
  cfg.canBitrate = 2;          /* 500 kbit/s */
  cfg.canEcuProtocol = 1;      /* rusEFI / epicEFI verbose broadcast */
  cfg.serialBaud = 4;          /* 115200 */
  for (int i = 0; i < N_AN; i++) {
    CFG_AN(&cfg, i)->ratiometric = 1;
  }
  for (int i = 0; i < N_FQ; i++) {
    CFG_FQ(&cfg, i)->canScale = 1;   /* x10 */
  }
}

bool config_load(void) {
  BaseFlash *fl = (BaseFlash *)&EFLD1;
  const flash_descriptor_t *fd = flashGetDescriptor(fl);
  flash_offset_t off = flashGetSectorOffset(fl, CFG_SECTOR);
  const cfg_header_t *h = (const cfg_header_t *)(fd->address + off);
  const uint8_t *data = (const uint8_t *)(h + 1);
  if (h->magic == CFG_MAGIC && h->size == sizeof(cfg) && h->crc == crc32(data, sizeof(cfg))) {
    memcpy(&cfg, data, sizeof(cfg));
    return true;
  }
  config_defaults();
  return false;
}

bool config_burn(void) {
  BaseFlash *fl = (BaseFlash *)&EFLD1;
  flash_offset_t off = flashGetSectorOffset(fl, CFG_SECTOR);
  cfg_header_t h = { CFG_MAGIC, sizeof(cfg), crc32(&cfg, sizeof(cfg)) };
  bool ok = false;

  /* erasing a 128 KiB sector stalls the CPU for about a second: keep the actuator bridge off meanwhile */
  act_inhibit(true);
  if (flashStartEraseSector(fl, CFG_SECTOR) == FLASH_NO_ERROR && flashWaitErase(fl) == FLASH_NO_ERROR) {
    if (flashProgram(fl, off, sizeof(h), (const uint8_t *)&h) == FLASH_NO_ERROR &&
        flashProgram(fl, off + sizeof(h), sizeof(cfg), (const uint8_t *)&cfg) == FLASH_NO_ERROR) {
      ok = true;
    }
  }
  act_inhibit(false);
  if (ok) {
    live.needBurn = false;
  }
  return ok;
}
