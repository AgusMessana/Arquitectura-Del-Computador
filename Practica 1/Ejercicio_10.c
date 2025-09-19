#include <stdio.h>

int main() {
  char a = 127;
  printf(" %hhd %hhu\n", a, a);
  a = ++a;
  printf(" %hhd %hhu\n", a, a);
  unsigned char b = 128;
  printf(" %hhd %hhu\n", b, b);
  b = ++b;
  printf(" %hhd %hhu\n", b, b);
  return 0;
}

// Usando %hhd y %hhu imprime:
// 127 127 (tanto en signed como en unsigned, se imprime 127).
// -128 128 (como char es signed, ocurre overflow, por eso hhd imprime -128. En unsigned sigue igual).
// -128 128 (lo mismo que el print anterior).
// -127 129 (como hhd interpreta signed, 129 produce overflow, y por ende es -127 en signed. En unsigned se interpreta como 129).
// Si se cambian los modificadores a %d y %u, se obtienen los mismos valores pues en lo único que cambia es que las variables char pasan a int.