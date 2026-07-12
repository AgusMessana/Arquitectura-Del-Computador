.data
a: .word -1
b: .byte 0xaa, 99
c: .float 1.5
str: .asciz "Hola mundo\n"

Etiqueta   Dirección    Valor
--------   ---------    -----
a          0x404028     0xFF      # .word -1 = 0xFFFF (little-endian: FF FF)
           0x404029     0xFF
b          0x40402A     0xAA      # .byte 0xaa, 99
           0x40402B     0x63      # 99 decimal = 0x63
c          0x40402C     0x00      # .float 1.5 = 0x3FC00000 (little-endian)
           0x40402D     0x00
           0x40402E     0xC0
           0x40402F     0x3F
str        0x404030     'H'       # el primer char va en la posición más baja
           0x404031     'o'
           0x404032     'l'
           0x404033     'a'
           0x404034     ' '
           0x404035     'm'
           0x404036     'u'
           0x404037     'n'
           0x404038     'd'
           0x404039     'o'
           0x40403A     '\n'        # 0x0A
           0x40403B     '\0'        # 0x00, agregado por .asciz