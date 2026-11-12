/* Small helpers: CRC32 (same polynomial as the TunerStudio envelope), interpolation, tables. */
#include "canio.h"

static uint32_t crcTable[256];

void crc32_init(void) {
  for (uint32_t i = 0; i < 256; i++) {
    uint32_t c = i;
    for (int k = 0; k < 8; k++) {
      c = (c & 1U) ? (0xEDB88320U ^ (c >> 1)) : (c >> 1);
    }
    crcTable[i] = c;
  }
}

uint32_t crc32_inc(const void *buf, uint32_t crc, size_t n) {
  const uint8_t *p = (const uint8_t *)buf;
  crc = ~crc;
  while (n--) {
    crc = crcTable[(crc ^ *p++) & 0xFFU] ^ (crc >> 8);
  }
  return ~crc;
}

float clampf(float v, float lo, float hi) {
  if (v < lo) return lo;
  if (v > hi) return hi;
  return v;
}

/* Linear interpolation, clamped to the two end points. */
float interp(float x0, float y0, float x1, float y1, float x) {
  if (x1 == x0) return y0;
  float t = (x - x0) / (x1 - x0);
  t = clampf(t, 0.0f, 1.0f);
  return y0 + t * (y1 - y0);
}

static int find_bin(const float *bins, int n, float x, float *frac) {
  if (x <= bins[0]) { *frac = 0.0f; return 0; }
  if (x >= bins[n - 1]) { *frac = 1.0f; return n - 2; }
  for (int i = 0; i < n - 1; i++) {
    if (x < bins[i + 1]) {
      float d = bins[i + 1] - bins[i];
      *frac = (d > 0.0f) ? (x - bins[i]) / d : 0.0f;
      return i;
    }
  }
  *frac = 1.0f;
  return n - 2;
}

float curve_lookup(const float *bins, const float *vals, int n, float x) {
  float f;
  int i = find_bin(bins, n, x, &f);
  return vals[i] + f * (vals[i + 1] - vals[i]);
}

/* 8x8 table stored row by row, one row per Y bin (same order TunerStudio uses for zBins). Returns the raw cell value. */
float table8x8(const float *xb, const float *yb, const uint8_t *tbl, float x, float y) {
  float fx, fy;
  int ix = find_bin(xb, 8, x, &fx);
  int iy = find_bin(yb, 8, y, &fy);
  float a = tbl[iy * 8 + ix], b = tbl[iy * 8 + ix + 1];
  float c = tbl[(iy + 1) * 8 + ix], d = tbl[(iy + 1) * 8 + ix + 1];
  float lo = a + fx * (b - a);
  float hi = c + fx * (d - c);
  return lo + fy * (hi - lo);
}
