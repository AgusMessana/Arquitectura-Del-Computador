.global main
main:
  movq $0x1122334455667788, %rax
  addq $0x1122334455667788, %rax
  ret

# En la arquitectura x86-64, la mayoría de las instrucciones aritméticas y lógicas (como addq) no soportan operandos inmediatos (constantes) de 64 bits; el límite para el valor inmediato es de 32 bits (con extensión de signo). La instrucción movq es una de las pocas excepciones que permite cargar un valor inmediato completo de 64 bits en un registro. Para operar con constantes de 64 bits, primero deben moverse a un registro intermedio.
