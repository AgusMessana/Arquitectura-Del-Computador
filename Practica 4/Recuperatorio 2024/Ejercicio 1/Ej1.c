#include <stdio.h>
int a[4] = { 0xaaaaaaaa, 0x11223344, 16, 4 };

int determinante(int a, int b, int c, int d) {
  int r = a * d - b * c;
  printf("Determinante: %d * %d - %d * %d = %d\n", a, d, b, c, r);
  return r;
}

int main() {
  int x = a[0], y = a[1], z = a[2], w = a[3];
  printf
      ("Vamos a calcular el determinante de la matriz \n %d \t %d \n %d \t %d \n",
       x, y, z, w);
  int r = determinante(x, y, z, w);
  return 0;
}
