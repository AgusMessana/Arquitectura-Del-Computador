.data
  vector1: .float 1.1, 2.2, 3.3, 4.4, 5.5
  vector2: .float 6.6, 7.7, 8.8, 9.9, 10.0
  resultado: .space 20
  str_sum: .asciz "Resultado de la suma:\n"
  str_for: .asciz "%.2f "
  str_n: .asciz "\n"

.text
.global suma_vectores
.global main

suma_vectores:
  # vector1 -> rdi
  # vector2 -> rsi
  # resultado -> rdx
  # longitud -> ecx
  pushq %rbp
  movq %rsp, %rbp
  
  movl $0, %r8d # indice
for:
  cmpl %ecx, %r8d # Comparo el índice respecto a la longitud
  jge fin # Si r8d >= ecx, termino
  movss (%rdi, %r8, 4), %xmm0 # xmm0 = vector1[i]
  movss (%rsi, %r8, 4), %xmm1 # xmm1 = vecotr2[i]
  addss %xmm1, %xmm0 # xmm0 = xmm0 + xmm1 = vector1[i] + vector2[i]
  movss %xmm0, (%rdx, %r8, 4) # resultado[i] = xmm0 = vector1[i] + vector2[i]
  incl %r8d
  jmp for

fin:
  movq %rbp, %rsp
  popq %rbp
  ret

main:
  pushq %rbp
  movq %rsp, %rbp
  pushq %r12
  pushq %r13

  leaq vector1, %rdi
  leaq vector2, %rsi
  leaq resultado, %rdx
  movl $5, %ecx
  call suma_vectores 
  # Ahora resultado guarda todos los valores sumados

  leaq str_sum, %rdi
  xorl %eax, %eax
  call printf

  movl $5, %r13d # longitud
  movl $0, %r12d # indice
for_main:
  cmpl %r13d, %r12d # Comparo el índice respecto a la longitud
  jge fin_main

  leaq str_for, %rdi
  movss resultado(, %r12, 4), %xmm0
  cvtss2sd %xmm0, %xmm0
  movl $1, %eax
  call printf

  incl %r12d
  jmp for_main

fin_main:
  leaq str_n, %rdi
  xorl %eax, %eax
  call printf

  popq %r13
  popq %r12
  movq %rbp, %rsp
  popq %rbp
  xorl %eax, %eax
  ret
