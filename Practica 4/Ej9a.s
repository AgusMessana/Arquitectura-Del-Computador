.data
a: .word -1
b: .byte 0xaa, 99
c: .float 1.5
str: .asciz "Hola mundo\n"

.text
.global main
main:
  leaq a, %rdx
  //................. # ax = 0xffff
  //................. # al = 0x63
  //................. # esi = "aloH"
  //................. # edi = 0x3fc00000
  //movl %esi, ( %rdx)
  ret

/*
Etiqueta     Dirección de memoria     Valor almacenado
a            0x0000000000404028       0xFFFF
b            0x000000000040402a       0xAA
b+1          0x000000000040402b       0x63
c            0x000000000040402c       0x3FC00000
str          0x0000000000404030       "Hola mundo\n"
*/