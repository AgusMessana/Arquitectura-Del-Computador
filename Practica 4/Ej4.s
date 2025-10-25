.text
.global main
main:
  movq $-1, %rax // q == quadword (64 bits)
  movb $0, %al // b == byte (8 bits)
  movw $0, %ax // w == word (16 bits)
  movl $0, %eax // l == doubleword (32 bits)
  ret

// Inicio: $rax con un valor aleatorio
// movq $-1, %rax: $rax = -1 = 0xFFFFFFFFFFFFFFFF
// movb $0, %al: se cambia el byte bajo (AL) del $rax, quedando $rax = 0xFFFFFFFFFFFFFF00
// movw $0, %ax: cambia los 2 bytes bajos (AX) del $rax, quedando $rax = 0xFFFFFFFFFFFF0000
// movl $0, $eax: cambia todos los bits superiores, quedando $rax = 0x0000000000000000 (esto sucede por la estructura x86_64)
