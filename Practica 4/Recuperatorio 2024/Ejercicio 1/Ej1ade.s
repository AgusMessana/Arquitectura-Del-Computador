.data
a: .long 0xaaaaaaaa, 0x11223344, 16, 4
str: .asciz "Vamos a calcular el determinante de la matriz \n %d \t %d \n %d \t %d \n"
str1: .asciz "Determinante: %d * %d - %d * %d = %d\n"

.text
.global main
main:
  pushq %rbp                # rsp = 0x7fffffffeb40
  movq %rsp, %rbp
  subq $32, %rsp            # rsp = 0x7fffffffeb20
  movl a, %eax              # Completado
  movl %eax, -4(%rbp)       # a[0] / # Completado 
  movl a + 4, %eax          # Completado
  movl %eax, -8(%rbp)       # a[1] / # Completado
  movl a + 8, %eax          # Completado
  movl %eax, -12(%rbp)      # a[2] / # Completado
  movl a + 12, %eax         # Completado
  movl %eax, -16(%rbp)      # a[3] / # Completado
  movl -4(%rbp), %esi       # Completado
  movl -8(%rbp), %edx       # Completado
  movl -12(%rbp), %ecx      # Completado
  movl -16(%rbp), %r8d      # Completado
  leaq str, %rdi            # Completado
  xorl %eax, %eax           # Completado
  call printf               # rsp = 0x7fffffffeb20
  movl -4(%rbp), %edi       # Completado
  movl -8(%rbp), %esi       # Completado
  movl -12(%rbp), %edx      # Completado
  movl -16(%rbp), %ecx      # Completado
  call determinante
  movl %eax, -20(%rbp)      # Completado
  xorl %eax, %eax           # Completado
  leave                     # rsp = 0x7fffffffeb48
  ret

determinante:
  pushq %rbp                # rsp = 0x7fffffffeb10
  movq %rsp, %rbp
  subq $32, %rsp            # rsp = 0x7fffffffaef0
  movl %edi, -4(%rbp)       # Completado
  movl %esi, -8(%rbp)       # Completado
  movl %edx, -12(%rbp)      # Completado
  movl %ecx, -16(%rbp)      # Completado
  movl -4(%rbp), %eax       # Completado
  imull -16(%rbp), %eax     # rax = 0x00000000aaaaaaa8, rdx = 0x0000000000000010 /      # Completado
  movl %eax, %edx
  movl -8(%rbp), %eax       # Completado
  imull -12(%rbp), %eax     # rax = 0x0000000012233440, rdx = 0x00000000aaaaaaa8/       # Completado
  subl %eax, %edx
  movl %edx, -20(%rbp)      # Completado
  movl -4(%rbp), %esi       # Completado
  movl -16(%rbp), %edx      # Completado
  movl -8(%rbp), %ecx       # Completado
  movl -12(%rbp), %r8d      # Completado
  movl -20(%rbp), %r9d      # Completado
  leaq str1, %rdi           # Completado
  xorl %eax, %eax           # Completado
  call printf               # rsp = 0x7fffffffaef0
  movl -20(%rbp), %eax      # Completado
  leave                     # rsp = 0x7fffffffeb18
  ret
