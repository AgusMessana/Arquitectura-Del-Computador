#include <stdio.h>
#include <stdlib.h>
#include <ieee754.h>

unsigned frac_part(float val) {
  return (*(unsigned *) &val) & 0x007fffff;
}

unsigned exp_part(float val) {
  return (((*(unsigned *) &val) & 0x7f800000) >> 23);
}

int main(void) {
  float val;
  printf("Ingrese un número flotante: ");
  scanf("%f", &val);

  unsigned frac = frac_part(val);
  unsigned exp = exp_part(val);
  if(val < 0) {
    printf("Signo con función: 1\n");
  } else {
    printf("Signo con función: 0\n");
  }
  printf("Exponente con función: %x\n", exp);
  printf("Mantisa con función: %x\n", frac);

  printf("\n");

  union ieee754_float myfloat;
  myfloat.f = val;
  printf("Signo con librería: %x\n", myfloat.ieee.negative);
  printf("Exponente con librería: %x\n", myfloat.ieee.exponent);
  printf("Mantisa con librería: %x\n", myfloat.ieee.mantissa);

  return 0;
}
