
section .text
	global main

main:
    mov eax, 2
    int 0x80
    jmp main
