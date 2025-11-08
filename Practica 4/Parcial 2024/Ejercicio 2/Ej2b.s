.data
a: .byte 1, 2, 3, 4, 5
b: .quad 0x1122334455667788
str: .asciz "Hola mundo\n"

.text
.global main
main:
  movq b, %rax                  # rax = 0x1122334455667788
  movq $a, %rbx                 # rbx = 0x0000000000404028
  movl $4, %ecx                 # rcx = 0x0000000000000004
  movb (%rbx, %rcx, 1), %ah     # rax = 0x1122334455660588
  movl 0x5(%rbx), %eax          # rax = 0x0000000055667788
  lea b, %rbx                   # rbx = 0x000000000040402B
  movl b(,%rcx,1), %eax         # rax = 0x0000000011223344
  mulb %cl                      # rax = 000000000011220110
  ret