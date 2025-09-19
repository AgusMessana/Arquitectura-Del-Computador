#include <stdio.h>
#include <stdlib.h>

int is_one(long n, int b) {
  int mascara = 1L << b;
  if (n & mascara) {
    return 1;
  } else {
    return 0;
  }
}

// Toma un entero de 64 bits y lo imprima en binario.
void printbin(long n) {
  for (int i = 63; i >= 0; i--) {
    printf("%d", is_one(n, i));
    if (i % 8 == 0) {           // Separa cada byte
      printf(" ");
    }
  }
  printf("%s", "\n");

  return;
}

int main() {
  long num = 762;
  printbin(num);

  return 0;
}
