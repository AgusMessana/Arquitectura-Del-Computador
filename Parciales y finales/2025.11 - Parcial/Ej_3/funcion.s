.data
  str: .asciz "Suma: %f. Promedio: %f\n"

.text
.global funcion
funcion:
  pushq %rbp
  movq %rsp, %rbp
  pushq %rbx
  pushq %r12
  pushq %r13
  subq $8, %rsp

  movq %rdi, %r12 # Arreglo
  movq %rsi, %r13 # Cantidad
  xorl %ebx, %ebx # Índice
  xorps %xmm0, %xmm0 # Acumulador
  xorps %xmm1, %xmm1 # Auxiliar

loop_suma:
  cmpq %r13, %rbx
  jae termino_suma
  movss (%r12, %rbx, 4), %xmm1
  addss %xmm1, %xmm0
  incq %rbx
  jmp loop_suma

termino_suma:
  cvtss2sd %xmm0, %xmm2 # Suma doble precisión
  movsd %xmm2, %xmm3 # Auxiliar
  cvtsi2sdl %r13d, %xmm4 # Cantidad doble precisión (sdl para mover 32 bits)
  divsd %xmm4, %xmm3 # Promedio

imprimir:
  leaq str, %rdi
  movsd %xmm2, %xmm0
  movsd %xmm3, %xmm1
  movb $2, %al
  call printf

fin:
  movl %r13d, %eax
  andl $1, %eax
  addq $8, %rsp
  popq %r13
  popq %r12
  popq %rbx
  leave
  ret