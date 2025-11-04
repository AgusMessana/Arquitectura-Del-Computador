.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .byte 10

.text
.global main
main:
  movzbq length, %rcx
  leaq list, %rsi
  movq $0, %rax

loop_suma:
  addl (%rsi), %eax
  addq $4, %rsi
  loop loop_suma

  ret
