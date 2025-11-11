#include <stdio.h>

double cuadrado_promedio(int a, int b) {
  double da = (double)a;
  double db = (double)b;
  return (da * da + db * db) / 2.0;
}

int main() {
  int x = 3, y = 4;
  double resultado = cuadrado_promedio(x, y);
  printf("El promedio de los cuadrados es %f\n", resultado);
  return 0;
}