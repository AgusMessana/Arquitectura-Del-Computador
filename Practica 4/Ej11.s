.data
array:
  .byte 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88
fin_array:
longitud:
  .quad (fin_array - array)

.text
.global main
main:
  # Fase 1: apilado
  movq longitud, %rcx         # rcx = 8 
  leaq array, %rsi            # rsi = puntero al inicio del arreglo

loop_apilar:
  # Carga 1 byte de la dirección [rsi] en %rax, y extiende con ceros a 64 bits
  movzbq (%rsi), %rax
  pushq %rax                  # Apila el valor de 64 bits
  incq %rsi                   # Avanza el puntero (rsi++)
  loop loop_apilar
  # En este punto el stack tiene 8 valores. El tope tiene 0x88 y el fondo tiene 0x11

  # Fase 2: desapilado
  movq longitud, %rcx
  leaq array, %rdi

loop_desapilar:
  popq %rax                  # Desapila 64 bits en rax
  movb %al, (%rdi)           # Escribe ese byte en la dirección [rdi]
  incq %rdi                  # Avanza el puntero (rdi++)
  loop loop_desapilar

  ret
