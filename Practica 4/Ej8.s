.global main
main:
  # ----------- signed -----------
movl $-1, %eax # EAX = -1
movl $2, %ecx # ECX = 2
imull %ecx # EAX * ECX = -2 (guardado en EDX:EAX, con EDX parte alta (signo extendido) y EAX parte baja)
movslq %eax, %rax # extiende el signo de EAX a RAX

# ----------- unsigned -----------
xorq %rax, %rax # limpia RAX
movw $-1, %ax # AX = 0xFFFF
movw $2, %cx # CX = 2
mulw %cx # AX * CX = 0x1FFFE (guardado en DX:AX)
shlq $16, %rdx # desplaza DX 16 bits
orq %rdx, %rax # concatena -> RAX = 0x1FFFE

ret