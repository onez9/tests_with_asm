%macro p2 2


%endmacro 

%strlen che "hello world"

section .data
	msg db "hello anime anime", 0
	len equ $ - msg
	v1 dd 1.1, 2.2, 3.3, 4.4
	align 32

section .bss
	ms1 resb 1

section .text
	global _start


_start:
	;mov rax, 1

	movss xmm0, [v1]
	nop
	nop
	nop
	nop
	nop
	nop
	mov rcx, len
	mov [ms1], byte 0xa

	s1:
	push rcx
	mov rsi, 0
	s2:
	push rcx
	mov rax, 4
	mov rbx, 1
	lea rcx, [msg+rcx]
	mov rdx, 1
	int 0x80
	pop rcx
	inc rsi
	cmp rsi, 10
	jle s2


	mov eax, 4
	mov ebx, 1
	mov ecx, ms1
	mov edx, 1
	int 0x80

	pop rcx
	dec rcx

	cmp rcx, byte 0
	jge s1
	call exit


exit:
	mov rax, 1
	mov rbx, 0 
	int 0x80
