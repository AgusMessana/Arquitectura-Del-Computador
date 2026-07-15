calculo:
  pushq %rbp
  movq %rsp, %rbp

  # (a + c + d)
  movsbl %dil, %eax        # eax = a (char extendido a 32)
  movsbl %dl, %r8d         # r8d = c (char extendido)
  addl %r8d, %eax          # eax = a + c
  addl %ecx, %eax          # eax = a + c + d  (d es int, uso ecx)

  # (i + j)
  movl 16(%rbp), %r10d     # r10d = i
  addl 24(%rbp), %r10d     # r10d = i + j

  # (a+c+d) * (i+j)
  imull %r10d, %eax        # eax = resultado

  movq %rbp, %rsp
  popq %rbp
  ret
