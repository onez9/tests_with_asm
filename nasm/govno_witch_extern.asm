%macro www 2

	mov rax, 4
	mov rbx, 1
	mov rcx, %1
	mov rdx, %2
	int 80h
%endmacro



section	.data
	msg db 'The Sum is:',0xa	
	len equ $ - msg			

	num1 db '12345'
	num2 db '23456'
	sum db '     '
	string db 'hello world'

section .bss
	ss1 resb 3

section	.text
	extern printf
  global main					;must be declared for using gcc

main:	                ;tell linker entry point
  ;mov     esi, 4				;pointing to the rightmost digit
  ;mov     ecx, 5       	;num of digits
  ;clc

	push 1
	push 2
	push 3
	push 4

	pop rbx

	add rbx, '0'

	mov [ss1], rbx
	www ss1, 3

	mov rsp, 10000
	loop1:
	www msg, len


	dec rsp
	jnz loop1
	int 0x80

	pop rbx
	add rbx, '0'
	mov [ss1], rbx
	www ss1, 3

	pop rbx
	add rbx, '0'
	mov [ss1], rbx
	www ss1, 3

	pop rbx
	add rbx, '0'
	mov [ss1], rbx
	www ss1, 3

	push string
	call printf

	
  mov	rax,1							;system call number (sys_exit)
	mov rbx, 66
  int	0x80	        		;call kernel
