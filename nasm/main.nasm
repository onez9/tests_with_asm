%macro print 2 
	pusha

	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
	
	popa
%endmacro

;extern exit
;extern print_number
;extern gcd
;extern fibonacci
;extern factorial

%include "asmlib/fmt.inc"
%include "asmlib/sys.inc"
%include "asmlib/str.inc"
%include "asmlib/mth.inc"



section	.data
	;msg db 'The Sum is:',0xa	
	msg db 'Hello world bitch'
	len equ $ - msg			

	filename db 'file.txt'
	_buffer.size equ 20


section .bss
	ss1 resb 4
	;ss2 rb 4 not work only fast !!!!!!!!!!!!!
	ss2 resb 2
	res resb 4
	r resb 1

	_buffer resb _buffer.size
	_bss_char resb 1

section	.text
	extern printf, strcmp
	global _start
  ;global main					;must be declared for using gcc

_start:	                ;tell linker entry point
	mov eax, 11 
	mov ebx, 44
	call gcd
	;call factorial
	;call fibonacci
	call print_number
	call exit




