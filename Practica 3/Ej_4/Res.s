.text
.global main
main:
  movq $-1, %rax
  movb $0, %al
  movw $0, %ax
  movl $0, %eax
  ret

// 1° instrucción: %rax = 0xffffffffffffffff = - 1
// 2° instrucción: %rax = 0xffffffffffffff00 = -256
// 3° instrucción: %rax = 0xffffffffffff0000 = -65536
// 4° instrucción: %rax = 0x0 = 0

// Al modificar registros de 8 bits (%al) o 16 bits (%ax), el procesador aplica preservación parcial, manteniendo intactos los bits superiores del registro de 64 bits (%rax). Sin embargo, al escribir sobre un registro de 32 bits (%eax), se aplica la regla de extensión de ceros, la cual limpia automáticamente los 32 bits superiores del registro de 64 bits, poniéndolos en cero.
