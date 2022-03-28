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
extern myfuck

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
	jmp $$
	call exit


