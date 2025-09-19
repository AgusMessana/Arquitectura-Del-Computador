#include <stdio.h>
#include <stdlib.h>

// Indica si el bit b-ésimo del entero n es 1 o 0.
int is_one(long n, int b) {
  int mascara = 1L << b;        //usamos 1L para que sea long
  if (n & mascara) {
    return 1;
  } else {
    return 0;
  }
}

int main() {
  long numero = 0b1010;
  int bit_pos = 1;

  if (is_one(numero, bit_pos)) {
    printf("El bit %d es 1\n", bit_pos);
  } else {
    printf("El bit %d es 0\n", bit_pos);
  }

  return 0;
}
