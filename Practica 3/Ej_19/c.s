.data
  a: .long 0x7fffffff
  b: .long 1
  str_foo1: .asciz "Ejecutando foo1...\n"
  str_foo2: .asciz "Ejecutando foo2...\n"
  str_vals: .asciz "0x %x\n"
  str_main: .asciz "0x %x 0x %x\n "

.text
.global foo1
.global foo2
.global main

foo1:
  pushq %rbp
  movq %rsp, %rbp

  leaq str_foo1, %rdi
  xorl %eax, %eax
  call printf

  movl b, %r8d
  shll $31, %r8d
  addl a, %r8d
  movl %r8d, a

  leaq str_vals, %rdi
  movl a, %esi
  xorl %eax, %eax
  call printf

  movl a, %eax
  leave
  ret

foo2:
  pushq %rbp
  movq %rsp, %rbp

  leaq str_foo2, %rdi
  xorl %eax, %eax
  call printf

  movl a, %r8d
  addl b, %r8d
  movl %r8d, a

  leaq str_vals, %rdi
  movl a, %esi
  xorl %eax, %eax
  call printf

  movl a, %eax
  leave
  ret

main:
  pushq %rbp
  movq %rsp, %rbp
  pushq %rbx
  subq $8, %rsp

  call foo2
  movq %rax, %rbx

  call foo1

  leaq str_main, %rdi
  movq %rax, %rsi
  movq %rbx, %rdx
  xorl %eax, %eax
  call printf

  addq $8, %rsp
  popq %rbx
  leave
  ret
