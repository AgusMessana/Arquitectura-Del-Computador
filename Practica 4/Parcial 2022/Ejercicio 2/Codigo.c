#include <stdio.h>
#include <stdlib.h>

int imprime(double f);
double scale(int x, float b);
float b = 2.3;

int main(int argc, char *argv[]) {
  int x = atoi(argv[1]);
  return scale(x, b);
}

double scale(int x, float b) {
  int k = 8;
  double f = x * b + k;
  imprime(f);
  return f;
}

int imprime(double f) {
  printf("El valor escalado es %f\n", f);
  return 0;
}
