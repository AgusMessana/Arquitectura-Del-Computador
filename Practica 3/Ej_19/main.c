#include <stdio.h>
int a = 0x7fffffff, b = 1;

int foo1() {
  printf("Ejecutando foo1...\n");
  a = a + (b << 31);
  printf("0x %x\n", a);
  return a;
}

int foo2() {
  printf("Ejecutando foo2...\n");
  a = a + b;
  printf("0x %x\n", a);
  return a;
}

int main() {
  printf("0x %x 0x %x\n ", foo1(), foo2());
  return 0;
}

/*
a)
Se evalúa foo2 primero (evaluación derecha a izquierda del compilador).
foo2: a = 0x7fffffff + 1 = 0x80000000. Modifica la global a.
foo1: usa la a ya modificada (0x80000000): a = 0x80000000 + (1<<31) = 0x80000000 + 0x80000000 = 0x100000000, truncado a 0.
printf imprime en orden de la cadena: foo1()=0, foo2()=0x80000000 → "0x0 0x80000000".

b)
Función     Operación                 Resultado     CF      OF      SF
foo2        0x7fffffff + 1            0x80000000    0       1       1
foo1        0x80000000 + 0x80000000   0x00000000    1       1       0
*/
