#include <stdio.h>

int main() {
  char a = 127;
  printf(" %d %u\n", a, a);

  a = ++a;
  printf(" %d %u\n", a, a);

  unsigned char b = 128;
  printf(" %d %u\n", b, b);

  b = ++b;
  printf(" %d %u\n", b, b);

  return 0;
}

/**
 * Primero se define a como 127, lo que en binario es (0111 1111). Por lo tanto, el primer printf va a imprimir 127 127.
 * Luego se le suma 1 al valor a, dando como resultado 128, lo que en binario es (1000 0000). Aquí el printf cambia. Si imprimimos con el modificador %hhd, se toma el valor como signed, y si usamos %hhd como unsigned. Por eso, el segundo print va a imprimir -128 (pues 1000 0000 representa a 128 o a -128 en complemento a 2) seguido de 128.
 * Aunque b se defina como unsigned, el modificador %hhd lo sigue tomando somo signed, Por eso imprime lo mismo que el segundo printf de a: -128 128.
 * Finalmente al sumarle 1, nos queda -127 y 129.
 */
