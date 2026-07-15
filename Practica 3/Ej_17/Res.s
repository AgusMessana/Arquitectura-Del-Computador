.data
  format: .asciz "%ld\n"
  format_hex: .asciz "0x%lx\n"
  i: .quad 0xDEADBEEF

.text
.global main
  main:
  pushq %rbp
  movq %rsp, %rbp

  # Ejemplo
  movq $format, %rdi # El primer argumento es el formato
  movq $1234, %rsi # El valor a imprimir
  xorq %rax, %rax # Cantidad de valores de punto flotante
  call printf

  # a)
  movq $format_hex, %rdi
  movq %rsp, %rsi
  xorl %eax, %eax
  call printf

  # b)
  movq $format, %rdi
  movq $format, %rsi
  xorl %eax, %eax
  call printf

  # c)
  movq $format_hex, %rdi
  movq $format, %rsi
  xorl %eax, %eax
  call printf

  # d)
  movq $format_hex, %rdi
  movq (%rsp), %rsi # Con (%rsp) imprimimos el valor EN rsp, no su dirección.
  xorl %eax, %eax
  call printf

  # e)
  movq $format_hex, %rdi
  movq 8(%rsp), %rsi
  xorl %eax, %eax
  call printf

  # f)
  movq $format_hex, %rdi
  movq i, %rsi
  xorl %eax, %eax
  call printf

  # g)
  movq $format_hex, %rdi
  movq $i, %rsi
  xorl %eax, %eax
  call printf

  movq %rbp, %rsp
  popq %rbp
  ret
