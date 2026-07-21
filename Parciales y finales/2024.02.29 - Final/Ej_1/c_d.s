.data
  a: .byte -99, 57
  f: .float 7.5, 3.5
  str: .asciz "%f %d\n"

.text
.global main
main:
  pushq %rbp # rbp = 0x1, rsp = 0x7fffffffebc0
  movq %rsp, %rbp # rbp = 0x7fffffffebc0, rsp = 0x7fffffffebc0
  subq $32, % rsp # rsp = 0x7fffffffeba0
  movl a, %eax # rax = 0x000000000000399d
  movl %eax, -4(%rbp) # rbp = 0x7fffffffebc0
  movl a+4, %eax # rax = 0x00000000000040f0
  movl %eax, -8(%rbp) # rbp = 0x7fffffffebc0
  movq f, %rax # rax = 0x4060000040f00000
  movq %rax, -16(%rbp) # rbp = 0x7fffffffebc0
  movq f+4, %rax # rax = 0x2520662540600000
  movq %rax, -24(%rbp) # rbp = 0x7fffffffebc0

  leaq a, %rdi
  leaq f, %rsi

  call calculo # ax = 0x0000, rsp = 0x7fffffffeba0

  leaq str, %rdi
  movl $1, %eax

  call printf

  # Di vuelta las instrucciones para que sean correctas,
  addq $32, % rsp # rsp = 0x7fffffffebc0
  movq %rbp, %rsp # rbp = 0x7fffffffebc0, rsp = 0x7fffffffebc0
  popq %rbp # rbp = 0x1, rsp = 0x7fffffffebc8
  xorl %eax, %eax # rax = 0x0000000000000000
  ret

calculo:
  pushq %rbp # rbp = 0x7fffffffebc0, rsp = 0x7fffffffeb90
  movq %rsp, %rbp # rbp = 0x7fffffffeb90

  movss (%rsi), %xmm0
  addss 4(%rsi), %xmm0
  cvtss2sd %xmm0, %xmm0
  movsbl (%rdi), %ecx
  movsbl 1(%rdi), %esi
  addl %ecx, %esi

  xorl %eax, %eax # rax = 0x0000000000000000
  movq %rbp, %rsp # rsp = 0x7fffffffeb90
  popq %rbp # rbp = 0x7fffffffebc0, rsp = 0x7fffffffeb98
  ret
