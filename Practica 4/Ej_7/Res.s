@ a)
add r3, r7, #1023
@ El error está en el inmediato 1023. Su ancho de bits es 10 (> 8),
@ y como los bits no se juntan ni dando la vuelta circular, no puede
@ expresarse como un byte rotado (I ROR 2R). Por lo tanto el ensamblador
@ no puede codificar la instrucción.
@ Alternativa:
movw r4, #1023 @ movw admite cualquier valor de 16 bits, sin byte rotado
add  r3, r7, r4 @ suma registro-registro, sin inmediato problemático

@ b)
sub r11, r12, r3, LSL #32
@ El error está en el monto de desplazamiento. El barrel shifter guarda la cantidad a desplazar en un campo de 5 bits (rango válido 0-31).
@ El valor 32 necesitaría 6 bits, así que no se puede codificar en la instrucción (error de ensamblado). Además, correr 32 lugares no tendría utilidad: dejaría el operando en 0.
@ Alternativa (usar el máximo válido):
sub r11, r12, r3, LSL #31
