.global main
main:
  # a) 10000000 00000000 00000000 00000000 == 1 << 31
  movl $1, %eax
  sall $31, %eax

  # b) 10000000 00000000 10000000 00000000 == (1 << 31) | (1 << 15)
  movl $1, %ebx
  sall $31, %ebx
  movl $1, %ecx
  sall $15, %ecx
  orl %ecx, %ebx

  # c) 11111111 11111111 11111111 00000000 == -1 & -256
  movl $-1, %edx
  movl $-256, %esi
  andl %esi, %edx

  # d) 10101010 00000000 00000000 10101010 == 0xAA | (0xAA << 24)
  movl $0xaa, %edi
  movl $0xaa, %ebp
  sall $24, %ebp
  orl %ebp, %edi

  # e) 00000000 00000000 00000101 00000000 == 5 << 8
  movl $5, %r12d
  sall $8, %r12d

  # f) 11111111 11111111 11111110 11111111 == -1 & (~(1 << 8))
  movl $-1, %r8d
  movl $1, %r9d
  sall $8, %r9d
  notl %r9d
  andl %r9d, %r8d

  # g) 11111111 11111111 11111111 11111111 == 0 - 1
  movl $0, %r10d
  subl $1, %r10d

  # h) 00000000 00000000 00000000 00000000 == 0x80000000 + 0x80000000
  movl $0x80000000, %r11d
  addl $0x80000000, %r11d

  ret

# No es estrictamente necesario gdb, pero el código de salida tiene dos limitaciones: sólo se observa lo que quede en rax (una expresión por programa) y además truncado a 8 bits, por lo que gdb es mucho más conveniente para ver los 32 bits completos de todas.