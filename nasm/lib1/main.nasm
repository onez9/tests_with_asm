section .data
	msg db "hello anime anime", 0
	len equ $ - msg
	;m db 0xa

section .bss

section .text
	global _start

_start:
	mov ecx, len

	s1:
	push ecx
	mov esi, 0

	s2:
	push ecx

	mov eax, 4
	mov ebx, 1
	lea ecx, [msg+ecx]
	mov edx, 1
	int 0x80

	pop ecx
	inc esi
	cmp esi, 3
	jle s2

	pop ecx

	dec ecx



	cmp ecx, byte 0
	jge s1

	call exit

exit:
	mov eax, 1
	mov ebx, 0 
	int 0x80
