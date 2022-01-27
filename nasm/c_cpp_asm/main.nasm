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

;%include "./asmlib/fmt.inc"
;%include "./asmlib/sys.inc"
;%include "./asmlib/str.inc"
;%include "./asmlib/mth.inc"

extern exit
extern print_number

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


	;push '8'
	push qword 'wor3'

	mov rax, 4234
	call print_number
	call print_number

	;call func
	call exit
	;call exit
	;mov rax, 60
	;xor rdi, rdi
	;syscall



; +8
func:
	push rbp
	mov rbp, rsp

	push '6'
	mov rax, "h3243lee"
	push rax

	mov rax, 1
	mov rdi, 1
	lea rsi, [rsp] ; show 6
	mov rdx, 8
	syscall
	printchar msg, len

	mov rcx, 200
	l1:

	mov rbx, rcx

	mov rax, 1
	mov rdi, 1
	lea rsi, [rbx]
	mov rdx, 8


	push rcx
	syscall
	;printchar msg, len
	pop rcx
	loop l1

	
	add rsp, 16
	pop rbp
	ret


