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

void printbin(long n) {
  int contador = 0;
  for (int i = 64; i > 0; i--) {
    contador++;
    if (is_one(n, i)) {
      printf("1");
    } else {
      printf("0");
    }
    if(contador % 8 == 0) {
      printf("  ");
    }
  }
}

int main(void) {
  long num;
  printf("Ingrese un número: ");
  scanf("%ld", &num);

  printf("0b");
  printbin(num);
  printf("\n");

  return 0;
}
