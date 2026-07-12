.global main
main:
  movb $0xFE, %al
  movb $-1, %bl
  addb %bl, %al
  incb %bl
  ret

// El programa mueve el valor 0xFE (254) a la parte baja del registro %rax.
// Luego mueve el -1 (0xFF) a la parte baja del registro %rbx.
// Después suma lo que está en %bl con lo que está en %al, y lo guarda en %al. Como es addB, la suma es en 8 bits. Si bien la suma nos da 9 bits, el más significativo se descarta. Por ende, el resultado será 253.
// Se incrementa en 1 el valor de %bl.
// Retorna con código 253.
