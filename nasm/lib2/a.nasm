section .data

section .bss

section .text
	global _start

_start:
	call 0x0bda:0xb728

	mov eax, 1
	xor ebx, ebx
	int 0x80
