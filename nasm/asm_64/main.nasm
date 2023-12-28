%include "./asmlib/fmt.inc"
%include "./asmlib/sys.inc"
%include "./asmlib/str.inc"
%include "./asmlib/mth.inc"
%strlen heee "wherwerwer"

%define Inf __?Infinity?__ 
%define NaN __?QNaN?__ 
;extern exit
;extern print_number
;extern fibonacci
;extern factorial
;extern string2number
;extern number2string
;extern myfuck

global msg
global len

section .data
	msg db 0xa, "-----------------------------------12312---------------", 0xa, 0x0
	len equ $ - msg
	t equ $$
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	mov rax, $
	call print_number
	mov rax, $$
	call print_number
	mov rax, t
	call print_number
	;#ilog2e()

	call exit


