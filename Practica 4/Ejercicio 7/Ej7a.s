.global main
main:
  movq $0x1122334455667788, %rax
  rorq $32, %rax
  ret
