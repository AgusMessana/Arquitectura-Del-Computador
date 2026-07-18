#include <stdio.h>

unsigned int campesino_ruso(unsigned int i, unsigned int j);

int main() {
  printf("3 x 5 = %u\n", campesino_ruso(3, 5)); // esperado: 15
  printf("7 x 6 = %u\n", campesino_ruso(7, 6)); // esperado: 42
  printf("9 x 1 = %u\n", campesino_ruso(9, 1)); // esperado: 9  (caso borde)
  return 0;
}
