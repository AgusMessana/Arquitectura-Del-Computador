.global main
main:
  movq $0x1122334455667788, %rax
  addq $0x1122334455667788, %rax
  ret

// El error que arroja es en el operador add.
// Esto sucede porque el operador addq acepta inmediatos de 32 bits como máximo.
// Para solucionarlo, se puede cargar el segundo valor a otro registro, y luego sumarlos.
/* 
.global main
main:
  movq $0x1122334455667788, %rax
  movq $0x1122334455667788, %rbx
  addq %rbx, %rax
  ret
*/
