#include <stdio.h>

unsigned int potencia(unsigned int i);

int main() {
  printf("2^0  = %u\n", potencia(0));   // 1
  printf("2^1  = %u\n", potencia(1));   // 2
  printf("2^10 = %u\n", potencia(10));  // 1024
  printf("2^31 = %u\n", potencia(31));  // 2147483648
  return 0;
}
