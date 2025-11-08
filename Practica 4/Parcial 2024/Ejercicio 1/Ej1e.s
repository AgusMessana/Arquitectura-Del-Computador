.data
str1: .asciz "Estoy en foo!\n"
str2: .asciz "La cantidad de argumentos es %d\n"
str3: .asciz "El argumento %d es %s\n"
str4: .asciz "Cantidad de argumentos insuficientes"

.text
.global main
main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movq %rdi, -8(%rbp)         # Completado
  movq %rsi, -16(%rbp)        # Completado

  cmpq $1, -8(%rbp)
  jle error

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
  leaq str1, %rdi             # Completado
  xorl %eax, %eax             # Completado
  call printf
  movq %rbp, %rsp             # Completado
  popq %rbp                   # Completado
  xorl %eax, %eax
  ret

error:
  leaq str4, %rdi
  xorl %eax, %eax
  call printf
  movq %rbp, %rsp
  popq %rbp
  movl $1, %eax               # Código de error
  ret
