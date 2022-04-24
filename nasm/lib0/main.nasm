%macro print 2 
	pusha

	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
	
	popa
%endmacro

%include "asmlib/fmt.inc"
%include "asmlib/sys.inc"
%include "asmlib/str.inc"
%include "asmlib/mth.inc"
;import 
;export


section	.data
	fmt db "[%s]", 0
	msg db "hello, world", 0
	len equ $ - msg

	;msg db 'The Sum is:',0xa	
	;msg db 'Hello world bitch'
	;len equ $ - msg			

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
	global _start
  ;global main					;must be declared for using gcc

_start:	                ;tell linker entry point

	push msg
	mov eax, fmt
	call printf


	


	call exit





section .time
time:
	mov eax, 13
	xor ebx, ebx
	int 0x80

section .printf
; eax = input
; stack = values

printf:
	.next_iter:
		cmp [eax], byte 0
		je .close

		cmp [eax], byte '%'
		je .special_char

		.special_char:
			jmp .next_step

		.default_char:
			push eax
			mov eax, [eax]

			print msg, len
			pop eax
			jmp .next_step
		.next_step:
			inc eax
			jmp .next_iter
	.close:
		ret

section .print_char
print_char:
	push ebx
	push ecx
	push edx

	
	mov [ss1], eax
	mov eax, 4
	mov ebx, 1
	mov ecx, ss1
	mov edx, 1
	int 0x80

	pop ebx
	pop ecx
	pop edx
	ret













