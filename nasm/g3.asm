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

	fmt     db      "Comparison = %s", 0xa, 0x0
	str1    db      "Hello", 0x0
	str2    db      "Hellx", 0x0

	num1 db '12345'
	num2 db '23456'
	sum db '     '
	string db 'hello world %d', 0xa, 0x0

section .bss
	ss1 resb 3

section	.text
	extern printf, strcmp
  global main					;must be declared for using gcc

main:	                ;tell linker entry point
  ;mov     esi, 4				;pointing to the rightmost digit
  ;mov     ecx, 5       	;num of digits
  ;clc
	;push 1
	;push 2
	;push 3
	push rbp
	mov rax, 10
	;mov rbp, rsp
	;push string
	;pop rbx
	;add rbx, '0'
	
	


	loo:
	push rax
	lea rdi, [string]
	mov rsi, rax
	;xor rax, rax
	mov rax, 1
	
	call printf

	pop rax
	dec rax
	jnz loo

	;lea rdi, [fmt]
	;mov rsi, rax
	;xor rax, rax
	;mov [ss1], rbx
	;mov rsp, 10000
	;loop1:
	;www msg, len
	;dec rsp
	;jnz loop1
	;int 0x80
	;pop rbx
	;add rbx, '0'
	;mov [ss1], rbx
	;www ss1, 3
	;pop rbx
	;add rbx, '0'
	;mov [ss1], rbx
	;www ss1, 3
	;pop rbx
	;add rbx, '0'
	;mov [ss1], rbx
	;www ss1, 3
	;push string
	;call printf
	;leave
	;ret
  ;mov rax,1							;system call number (sys_exit)
	xor rax, rax
	mov rbx,0 
  int	0x80	        		;call kernel
