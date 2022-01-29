[bits 64]
%macro printchar 2
	push rax
	push rdi
	push rsi
	push rdx

	mov rax, 1
	mov rdi, 1
	lea rsi, %1
	mov rdx, %2
	syscall

	pop rax
	pop rdi
	pop rsi
	pop rdx
	


%endmacro

;-- s1:
;%include "./asmlib/fmt.inc"
;%include "./asmlib/sys.inc"
;%include "./asmlib/str.inc"
;%include "./asmlib/mth.inc"
%strlen heee "wherwerwer"

extern exit
extern print_number
extern fibonacci
extern factorial
extern string2number
extern number2string

global msg
global len

section .data
	msg db 0xa, "--------------------------------------------------", 0xa, 0x0
	len equ $ - msg

	msg1 db "hello black", 0xa, 0x0
	len1 equ $ - msg1

	msg2 db "Hello white", 0xa, 0x0
	len2 equ $ - msg2

section .bss
  inw resb 8

segment .text
	;global main
	global _start

_start:

	;jmp $
	;call fac1
	call print_number
	jmp $
	call exit


; +8
fac2:
	mov rbx, rax
	.next_iter:
		dec rbx
		mul rbx
		;call print_number
		cmp rbx, 1
		je .qu
	jmp .next_iter

	.qu:
		ret
fac1:
	;enter
	push rbp
	mov rbp, rsp

	push rax
	cmp rax, 1
	je .qu

	dec rax
	call fac1

	.qu:
		pop rbx
		mul rbx
		call print_number

		mov rsp, rbp
		pop rbp
		;leave
		ret


