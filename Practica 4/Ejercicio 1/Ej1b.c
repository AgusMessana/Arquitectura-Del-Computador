#include <stdio.h>

int main() {
  unsigned char al = 0xFE;
  unsigned char bl = (unsigned char)-1;
  al = al + bl;
  bl = bl + 1;
  return al;
}