#include <stdio.h>
#include <stdlib.h>

unsigned mult(unsigned a, unsigned b) {
  unsigned resultado = 0;
  while (b >= 1) {
    if (b & 1) {
      resultado += a;
    }
    b = b >> 1;
    a = a << 1;
  }

  return resultado;
}
