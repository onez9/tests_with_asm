%macro www 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
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
	string db 'hello world ', 0xa, 0x0
	lens equ $ - string

section .bss
	ss1 resb 3
	res resb 4

section	.text
	extern printf, strcmp
  global _start ;must be declared for using gcc

_start:	                ;tell linker entry point
	;push 2
	;push 3
	push ebp
	mov eax, 10
	;mov rbp, rsp
	;push string
	;pop
    ;add rbx, '0'
    

call  foo

	loo:
	push eax
	;lea rdi, [string]
	;mov rsi, rax
	;xor rax, rax
	;mov rax, 0 ; restart sys call
	mov eax, 3
	;add eax, '0'
	mov [ss1], eax
	www ss1, 3
	;call printf
	pop eax
	dec eax
	jnz loo
	int 0x80
	;www string, lens

	mov ecx, 10
	mov ax, 10

	;www string, lens

	l1:
	push ecx
	;push eax
	;www string, lens
	;pop eax

	;aaa
	;aas
	;aam
	;aad

	;sub al, 1

	;aas

	;mov [res], eax

	;push ax
	;mov eax, 4
	;mov ebx, 1
	;mov ecx, res
	;mov edx, 4
	;int 0x80
	;pop ax

	;pop ecx
	;loop l1
	call exit

	www msg, len
	
		







	;xor rax,0  for 64
exit:

	mov eax, 1
	mov ebx, 0 
  int	0x80	        		;call kernel
