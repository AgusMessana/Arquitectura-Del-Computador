/*
Dado el siguiente código en C:
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

Hacer un programa en Assembler x86-64 que haga lo mismo
 */

.data
two: .double 2.0
str: .asciz "El promedio de los cuadrados es %f\n"

.text
.global cuadrado_promedio
cuadrado_promedio:
  pushq %rbp
  movq %rsp, %rbp

  cvtsi2sd %edi, %xmm1          # %xmm1 = (double)a
  cvtsi2sd %esi, %xmm2          # %xmm2 = (double)b
  mulsd %xmm1, %xmm1            # %xmm1 = a*a
  mulsd %xmm2, %xmm2            # %xmm2 = b*b

  xorpd %xmm0, %xmm0            # %xmm0 = 0
  addsd %xmm1, %xmm0            # %xmm0 = a*a
  addsd %xmm2, %xmm0            # %xmm0 = a*a + b*b
  divsd two, %xmm0               # %xmm0 = (a*a + b*b) / 2

  leave
  ret

.global main
main:
  pushq %rbp
  movq %rsp, %rbp

  movl $3, %edi
  movl $4, %esi
  call cuadrado_promedio

  subq $8, %rsp
  leaq str, %rdi
  movl $1, %eax
  call printf
  addq $8, %rsp

  xorl %eax, %eax
  leave
  ret