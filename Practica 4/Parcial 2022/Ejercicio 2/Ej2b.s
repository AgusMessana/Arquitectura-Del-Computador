.data
b: .float 2.3
str: .asciz "El valor escalado es %f\n"

.text
.global imprime
imprime:
  pushq %rbp
  movq %rsp, %rbp
  subq 8, %rsp                   # Alineamos la pila a 16 bits para printf

  leaq str, %rdi
  movl $1, %eax
  call printf
  xorl %eax, %eax

  movq %rbp, %rsp
  popq %rbp
  ret

.global scale
scale:
  pushq %rbp
  movq %rsp, %rbp
  subq 16, %rsp             # 16 bytes para variables locales y alineación
  movl %edi, -4(%rbp)
  movss %xmm0, -8(%rbp)

  cvtsi2sd -4(%rbp), %xmm0
  cvtss2sd -8(%rbp), %xmm1
  mulsd %xmm1, %xmm0
  movl $8, %eax
  cvtsi2sd %eax, %xmm1
  addsd %xmm1, %xmm0
  movsd %xmm0, -16(%rbp)
  call imprime
  movsd -16(%rbp), %xmm0

  movq %rbp, %rsp
  popq %rbp
  ret

.global main
main:
  pushq %rbp
  movq %rsp, %rbp
  subq 16, %rsp                           # 16 bytes para 'x' y alineación

  movq 8(%rsi), %rdi
  call atoi
  movl %eax, -4(%rbp)

  movl -4(%rbp), %edi
  movss b, %xmm0
  call scale

  cvttsd2si %xmm0, %eax

  movq %rbp, %rsp
  popq %rbp
  ret