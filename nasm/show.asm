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

	msg5 db 'l7 not run',0xa
	len5 equ $ - msg5

	msg6 db 'I love anime!. true'
	len6 equ $ - msg6

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

	;mov ax,'9'
	;sub ax,'0' ; convert string to number

	;mov bl,'4'
	;sub bl,'0'
	

	;clc 
	;div bl

	;add al, '0' ; convert number to string 
	;add ah, '0'

	;mov [num], al ; remainder, residue, balance
	;mov [remainder], ah ; remainder, residue, balance
	;mov , al
	;mov [remainder], ah ; remainder, residue, balance

	;write_string num, 13
	;write_string remainder, 13
	

	;mov ax, 7          ; записываем 8 в регистр AX 
  ;not ax
  ;not ax
	;add ax, '0'

	;mov ax, 4          ; записываем 8 в регистр AX 
  ;or ax, 3
	;add ax, '0'

	;mov ax, 4          ; записываем 8 в регистр AX 
  ;and ax, 3
	;add ax, '0'

	;mov ax, 4          ; записываем 8 в регистр AX 
  ;test ax, 3
	;add ax, '0'

	;mov [num], ax
	;write_string num, 3

	; In the following example fire both instruction, becose jumpt not happening
	mov dx, 5

	; if 5==0 -> 1, 2 else -> 2
	CMP DX,	0  ; сравниваем значение регистра DX с нулем dx == 5 !!!!!!!!!!!!!!!!!1
	JE  L7      ; если true, то переходим к метке L7 ; if result==0 -> ZF=1(true) else if dx==samonakereba then ZF=0(false)
	; if true then ignore ele jump with L7
	write_string msg6, len6 
	L7:
	write_string  msg5, len5




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
	
