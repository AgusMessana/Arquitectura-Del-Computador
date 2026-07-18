#include <stdio.h>

float determinante(float i, float j, float k, float l);

int main() {
  // matriz [1 2 ; 3 4] -> det = 1*4 - 2*3 = 4 - 6 = -2
  printf("det = %f\n", determinante(1.0f, 2.0f, 3.0f, 4.0f));
  // matriz [2 0 ; 0 2] -> det = 4
  printf("det = %f\n", determinante(2.0f, 0.0f, 0.0f, 2.0f));
  return 0;
}
