;%include 
%macro write_string 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h

%endmacro

section .data
  achar db '0'
	msg1 db 'Hello, programmers!',0xa,0xd
	len1 equ $ - msg1

	msg2 db 'Welcome to the world of',0xa,0xd
	len2 equ $ - msg2

	msg3 db 'Linux assembly programming',0xa,0xd
	len3 equ $ - msg3

	msg4 db '-----',0xa
	len4 equ $ - msg4

section .bss
	n1 resb 3
	n2 resb 3
	num resb 13
	remainder resb 13

section	.text
  global _start					; объявляем для использования gcc

	
_start:									; сообщаем линкеру входную точку
	; write_string msg1, len1
	; write_string msg2, len2
	; write_string msg3, len3
	; invoce

	mov ax,'9'
	sub ax,'0' ; convert string to number

	mov bl,'4'
	sub bl,'0'
	

	;clc 
	div bl

	add al, '0' ; convert number to string 
	add ah, '0'

	mov [num], ah ; remainder, residue, balance
	mov [remainder], ah ; remainder, residue, balance
	;mov , al
	;mov [remainder], ah ; remainder, residue, balance

	write_string num, 13
	write_string remainder, 13
	

	;write_string msg4, len4
  ;call display
  mov	 eax,1							; номер системного вызова (sys_exit)
  int	 0x80	        		; вызов ядра
	
display:
	;write_string msg3, len3
  mov  ecx, 256
	;mov  rax, 1
	
next:
	;call display
  push ecx
  mov  eax, 4
  mov  ebx, 1
  mov  ecx, achar
  mov  edx, 1
  int  80h
  
  pop  ecx	
  mov	 dx,  [achar]
  cmp	 byte [achar], 0dh
  inc	 byte [achar]
  loop next
  ret
	
