.data
str1: .asciz "Estoy en foo! La cantidad de argumentos es %ld\n"
str2: .asciz "La cantidad de argumentos es %d\n"
str3: .asciz "El argumento %d es %s\n"

.text
.global main
main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movq %rdi, -8(%rbp)         # Completado
  movq %rsi, -16(%rbp)        # Completado

  movq -8(%rbp),  %rdi

  call foo
  leaq str2, %rdi             # Completado
  movq -8(%rbp), %rsi         # Completado
  xorl %eax, %eax             # Completado
  call printf
  xorl %r12d, %r12d
  movq -16(%rbp), %rbx
bucle:
  movq $str3, %rdi            # Completado
  movq %r12, %rsi             # Completado
  movq (%rbx, %r12, 8), %rdx  # Completado
  xorl %eax, %eax             # Completado
  call printf
  incq %r12
  cmpq %r12, -8(%rbp)         # Completado
  ja bucle                    # Completado
  movq %rbp, %rsp             # Completado
  popq %rbp                   # Completado
  xorl %eax, %eax
  ret
foo:
  pushq %rbp
  movq %rsp, %rbp

  pushq %rdi
  leaq str1, %rdi             # Completado
  popq %rsi

  xorl %eax, %eax             # Completado
  call printf
  movq %rbp, %rsp             # Completado
  popq %rbp                   # Completado
  xorl %eax, %eax
  ret
