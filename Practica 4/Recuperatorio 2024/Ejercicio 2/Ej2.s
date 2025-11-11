.data
str1: .asciz "Ingrese al menos una nota\n"
str2: .asciz "El promedio de las notas ingresadas es %f\n"

.text
.global main
main:
  pushq %rbp
  movq %rsp, %rbp

  pushq %rbx                    # Acá guardamos la suma total
  pushq %r12                    # Acá guardamos argc
  pushq %r13                    # Acá guardamos argv
  pushq %r14                    # Acá guardamos el contador
  pushq %r15                    # Acá va argc - 1 para el promedio
  subq $8, %rsp

  movq %rdi, %r12               # %r12 = argc
  movq %rsi, %r13
  xorq %rbx, %rbx               # %rbx = 0 (suma total)
  movq $1, %r14

  cmpq $1, %r12
  jle error

loop_suma:
  cmpq %r12, %r14
  jge fin

  movq(%r13, %r14, 8), %rdi
  call atoi
  movslq %eax, %rax
  addq %rax, %rbx

  incq %r14
  jmp loop_suma

error:
  leaq str1, %rdi
  xorl %eax, %eax
  call printf
  movl $1, %eax
  jmp epilogo

fin:
  movq %r12, %r15
  decq %r15

  cvtsi2sd %rbx, %xmm0
  cvtsi2sd %r15, %xmm1
  divsd %xmm1, %xmm0

  leaq str2, %rdi
  movl $1, %eax
  call printf
  
  xorl %eax, %eax
  jmp epilogo

epilogo:
  addq $8, %rsp
  popq %r15
  popq %r14
  popq %r13
  popq %r12
  popq %rbx
  leave
  ret
