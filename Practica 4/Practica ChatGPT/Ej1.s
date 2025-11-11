/*
Dado el siguiente código en C:
double promedio_ponderado(int a, int b, int c, double peso1, double peso2, double peso3) {
  double suma = a * peso1 + b * peso2 + c * peso3;
  printf("El promedio ponderado es %f\n", suma / (peso1 + peso2 + peso3));
  return suma / (peso1 + peso2 + peso3);
}
Hacer una función en Assembler x86-64 que haga lo mismo
 */

.data
str: .asciz "El promedio ponderado es %f\n"

.text
.global promedio_ponderado
promedio_ponderado:
  pushq %rbp
  movq %rsp, %rbp
  pushq %r10
  pushq %r11
  pushq %r12
  subq $8, %rsp

  movl %edi, %r10d        # a
  movl %esi, %r11d        # b
  movl %edx, %r12d        # c
  cvtsi2sd %r10d, %xmm3   # %xmm3 = double a
  cvtsi2sd %r11d, %xmm4   # %xmm4 = double b
  cvtsi2sd %r12d, %xmm5   # %xmm5 = double c
  
  mulsd %xmm0, %xmm3      # %xmm3 = a * peso1
  mulsd %xmm1, %xmm4      # %xmm4 = b * peso2
  mulsd %xmm2, %xmm5      # %xmm5 = c * peso3
  addsd %xmm4, %xmm3      # %xmm3 = a * peso1 + b * peso2
  addsd %xmm5, %xmm3      # %xmm3 = a * peso1 + b * peso2 + c * peso3

  movsd %xmm0, %xmm6      # %xmm6 = peso1
  addsd %xmm1, %xmm6      # %xmm6 = peso1 + peso2
  addsd %xmm2, %xmm6      # %xmm6 = peso1 + peso2 + peso3

  divsd %xmm6, %xmm3      # %xmm3 = %xmm3 / %xmm6

  leaq str, %rdi
  movsd %xmm3, %xmm0
  movl $1, %eax
  call printf
  xorl %eax, %eax

  addq $8, %rsp
  popq %r12
  popq %r11
  popq %r10
  leave
  ret
