.data
  a: .word -1, -2, 0xff, 0xab
  b: .quad 0x12345678
  str: .asciz "%d\n"

.text
.global main
main:
  movl a, %eax              # rax = 0x00000000FFFEFFFF
  movq $a, %rbx             # rbx = 0x0000000000404010
  movl $3, %ecx             # rcx = 0x0000000000000003
  movw (%rbx,%rcx,1), %ax   # rax = 0x00000000FFFEFFFF
  movb 0x5(%rbx), %al       # rax = 0x00000000FFFEFF00
  leaq b, %rbx              # rbx = 0x0000000000404018
  movl (%rbx,%rcx,1), %eax  # rax = 0x0000000000000012
  movl $-1, %r8d            # r8  = 0x00000000FFFFFFFF
  imull %r8d                # rax = 0x00000000FFFFFFEE, rdx = 0x00000000FFFFFFFF
  ret
