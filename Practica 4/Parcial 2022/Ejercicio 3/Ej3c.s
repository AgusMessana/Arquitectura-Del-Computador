.data
str: .long 1, 2, 3, 4
g: .quad 0x1122334455667788
msg: .asciz "Hola mundo"

.text
.global main
main:
  movl str, %eax                # rax = 0x0000000000000001
  movl str+4, %eax              # rax = 0x0000000000000002
  movb str+16, %al              # rax = 0x0000000000000088
  movq $3, %rbx
  movb str(,%rbx,4), %al        # rax = 0x0000000000000004
  leaq msg, %rax                # rax = 0x0000000000404040
  movb g(,%rbx,1), %al          # rax = 0x0000000000404055
  movl $0, %eax                 # rax = 0x0000000000000000
  ret