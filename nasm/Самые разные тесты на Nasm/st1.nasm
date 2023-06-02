section .data
	msg db 'hello world!',0xa
	len equ $ - msg

section .text
	global _start

_start:
	mov eax, 37
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 1
	int 0x80

