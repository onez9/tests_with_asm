section .data
	msg1 db "Hello black", 0xa, 0x0
	len1 equ $ - msg1

	msg2 db "Hello white", 0xa, 0x0
	len2 equ $ - msg2

section .bss

section .text
	global main

main:

	;lea rsi, $
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 0x80


	mov rcx, 10
	j1:
	push rcx

	mov rax, 1
	mov rdi, 1
	mov rsi, msg2
	mov rdx, len2
	syscall
	pop rcx

	loop j1


	xor eax, eax
	inc eax
	xor ebx, ebx
	int 0x80


