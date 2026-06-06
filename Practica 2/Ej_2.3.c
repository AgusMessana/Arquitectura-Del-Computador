#include <stdio.h>
#include <stdlib.h>

int main(void) {
  float val1 = 6.225;
  double val2 = 6.225;

  printf("Error en float: %.20f\n", 6.225 - val1);
  printf("Error en double: %.20Lf\n", 6.225L - val2);

  return 0;
}
