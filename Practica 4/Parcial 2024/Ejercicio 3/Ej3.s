.data
str: .asciz "La suma es: %f\nEl promedio es: %f\n"

.text
.global calcular_suma_y_promedio
calcular_suma_y_promedio:
  pushq %rbp
  movq %rsp, %rbp
  pushq %rbx
  pushq %r12

  movq %rdi, %rbx           # %rbx = puntero al arreglo
  movq %rsi, %r12           # %r12 = cantidad
  movq $0, %rax
  cvtsi2sdq %rax, %xmm0     # %xmm0 = 0.0
  xorq %rsi, %rsi

bucle_suma:
  cmpq %r12, %rsi
  jge fin_bucle

  movsd (%rbx, %rsi, 8), %xmm1
  addsd %xmm1, %xmm0
  incq %rsi
  jmp bucle_suma

fin_bucle:
  movsd %xmm0, %xmm1
  cvtsi2sd %r12, %xmm2
  divsd %xmm2, %xmm0
  leaq str, %rdi

  movsd %xmm0, %xmm2
  movsd %xmm1, %xmm0
  movsd %xmm2, %xmm1

  movl $2, %eax             # Ponemos %eax en 2 porque le pasamos 2 números flotantes.
  call printf               # Printf toma la cantidad de argumentos flotantes que le pasamos         

  xorl %eax, %eax
  popq %r12
  popq %rbx
  popq %rbp
  ret
