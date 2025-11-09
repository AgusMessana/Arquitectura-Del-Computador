.data
count: .long 5
str: .asciz "%d\n"

.text
.global fun
fun:
  incl count
  movl count, %eax
  ret

.global main
main:
  pushq %rbp
  movq %rsp, %rbp

  subq $8, %rsp

  call fun
  movl %eax, %esi
  leaq str, %rdi
  xorl %eax, %eax
  call printf

  call fun
  movl %eax, %esi
  leaq str, %rdi
  xorl %eax, %eax
  call printf

  xorl %eax, %eax
  movq %rbp, %rsp
  popq %rbp

  ret