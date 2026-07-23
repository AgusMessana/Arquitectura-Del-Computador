.data
  str1: .asciz "a: %d\n"
  str2: .asciz "r: %d\n"
  str3: .asciz "Cantidad de términos: N=%d\n"
  str4: .asciz "%d "
  str5: .asciz "\nSuma=%d\n"
  str6: .asciz "Cantidad de argumentos inválida\n"
  str7: .asciz "\nSe produjo overflow"

.text
.global main
.global suma_serie

suma_serie:
  pushq %rbp
  movq %rsp, %rbp
  pushq %rbx
  pushq %r12
  pushq %r13
  pushq %r14
  pushq %r15
  subq $8, %rsp

  movl %edi, %r12d # r12d -> a
  movl %esi, %r13d # r13d -> r
  movl %edx, %r14d # r14d -> N
  movl $0, %ebx # índice
  movl $0, %r15d # Acumulado

for:
  cmpl %r14d, %ebx
  jge fin_ok
  addl %r12d, %r15d
  jo overflow

  leaq str4, %rdi
  movl %r12d, %esi
  xorl %eax, %eax
  call printf
  incl %ebx

  cmpl %r14d, %ebx
  jge fin_ok

  imull %r13d, %r12d
  jo overflow
  jmp for

overflow:
  leaq str7, %rdi
  xorl %eax, %eax
  call printf
  movl $-1, %eax
  jmp epilogo

fin_ok:
  movl %r15d, %eax
  jmp epilogo

epilogo:
  addq $8, %rsp
  popq %r15
  popq %r14
  popq %r13
  popq %r12
  popq %rbx
  movq %rbp, %rsp
  popq %rbp
  ret

main:
  # Prólogo
  pushq %rbp
  movq %rsp, %rbp
  pushq %r12
  pushq %r13
  pushq %r14
  pushq %r15

  # rdi -> argc
  # rsi -> argv
  # Reservo las variables para no ser pisadas por los call. Creo las variables que voy a usar.
  movq %rsi, %r15 # r15 = argv

  cmpl $4, %edi
  jl error

  movq 8(%r15), %rdi
  call atoi
  # Ahora rax = a
  movl %eax, %r12d # r12d = a

  movq 16(%r15), %rdi
  call atoi
  # Ahora rax = r
  movl %eax, %r13d # r13d = r

  movq 24(%r15), %rdi
  call atoi
  # Ahora rax = N
  movl %eax, %r14d # r14d = N

  # r12 -> a
  # r13 -> r
  # r14 -> N

  # Prints de valores
  leaq str1, %rdi
  movl %r12d, %esi
  xorl %eax, %eax
  call printf

  leaq str2, %rdi
  movl %r13d, %esi
  xorl %eax, %eax
  call printf

  leaq str3, %rdi
  movl %r14d, %esi
  xorl %eax, %eax
  call printf

  movl %r12d, %edi
  movl %r13d, %esi
  movl %r14d, %edx
  call suma_serie

  movl %eax, %esi
  leaq str5, %rdi
  xorl %eax, %eax
  call printf
  jmp fin

error:
  leaq str6, %rdi
  xorl %eax, %eax
  call printf

# Epílogo
fin:
  popq %r15
  popq %r14
  popq %r13
  popq %r12
  movq %rbp, %rsp
  popq %rbp
  xorl %eax, %eax
  ret
