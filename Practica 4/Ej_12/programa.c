#include <stdio.h>
int a[] = { 1, 2, 3, 4 };
int b[] = { 2, 3, 4, 5 };

int suma(int a[], int b[], int L) {
  int i, result = 0;
  for (i = 0; i < L; i++) {
    result = result + a[i] + b[i];
  }
  return result;
}

int main() {
  int L = 4;
  printf("La suma es: %d\n", suma(a, b, L));
  return 0;
}
