#include <stdio.h>
#include <stdlib.h>

int is_one(long n, int b) {
  int bandera = 0;
  if (b == 0) {
    printf("Empezamos a contar desde el bit == 1.\n");
  }

  long mascara = 1L << (b - 1);
  long res = n & mascara;

  if (res != 0) {
    bandera = 1;
  }

  return bandera;
}

int main(void) {
  long valor;
  int bit;

  printf("Ingrese un número: ");
  scanf("%ld", &valor);
  printf("Ingrese un bit: ");
  scanf("%d", &bit);
  printf("\n");

  if (is_one(valor, bit)) {
    printf("El bit %d es 1.\n", bit);
  } else {
    printf("El bit %d es 0.\n", bit);
  }

  return 0;
}
