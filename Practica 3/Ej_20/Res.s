.data
str_error: .asciz "La cantidad de argumentos es insuficiente\n"
str_correcto: .asciz "Cantidad de argumentos: %d, suma de los argumentos: %d\n"

.text
.global main
main:
  pushq %rbp
  movq %rsp, %rbp
  pushq %rbx
  pushq %r12
  pushq %r13
  pushq %r14

  movq %rdi, %r12 # Guardo argc
  movq %rsi, %r13 # Guardo argv

  cmpq $2, %r12
  jb error

  xorl %ebx, %ebx # Suma
  movq $1, %r14 # Índice en 1

loop_suma:
  cmpq %r12, %r14 # indice - argc
  jae correcto # Sale si indice >= argc
  movq (%r13, %r14, 8), %rdi # argv[indice]

  xorl %eax, %eax
  call atoi

  addl %eax, %ebx # Acumulo suma
  incq %r14
  jmp loop_suma

correcto:
  leaq str_correcto, %rdi # Mensaje
  movq %r12, %rsi # argc
  movl %ebx, %edx # suma
  xorl %eax, %eax
  call printf
  jmp fin

error:
  leaq str_error, %rdi
  xorl %eax, %eax
  call printf
  jmp fin

fin:
  popq %r14
  popq %r13
  popq %r12
  popq %rbx
  leave
  ret
