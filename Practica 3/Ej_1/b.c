#include <stdio.h>
#include <stdint.h>

int main(void) {
  uint8_t al = 0xFE;
  int8_t bl = -1;
  al = al + bl;
  bl = bl + 1;

  return al;
}
