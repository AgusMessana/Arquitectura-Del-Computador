.data
msj_error: .asciz "Ingrese al menos un argumento\n"
msj_correcto: .asciz "Cantidad de argumentos ingresados: %d. La suma es %d.\n"

.text
.global main
main:
  pushq %rbp
  movq %rsp, %rbp
  pushq %rbx
  pushq %r12
  pushq %r13
  pushq %r14

  movq %rdi, %r12 # Cantidad de argumentos
  movq %rsi, %r13 # Array de llamada + strings numéricos

  cmpq $2, %rdi
  jb imprimir_error

  xorl %ebx, %ebx # Acumulador
  movq $1, %r14 # Índice

suma:
  cmpq %r12, %r14
  jae imprimir_mensaje
  movq (%r13, %r14, 8), %rdi # Lo llevo a rdi porque ahí lo espera atoi.
  call atoi # Guarda el resultado en rax.
  imulq %rax, %rax # Elevo al cuadrado.
  addq %rax, %rbx # Acumulo.
  incq %r14 # Incremento el índice
  jmp suma

imprimir_mensaje:
  leaq msj_correcto, %rdi
  movq %r12, %rsi
  decq %rsi
  movq %rbx, %rdx
  xorl %eax, %eax
  call printf
  jmp fin

imprimir_error:
  leaq msj_error, %rdi
  xorl %eax, %eax
  call printf
  jmp fin

fin:
  popq %r14
  popq %r13
  popq %r12
  popq %rbx
  popq %rbp
  ret
