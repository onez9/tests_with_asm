
section	.data
	msg db 0xa, '----------', 0xa ; наше сообщение
	len equ $- msg  ; длина нашего сообщения 
	;m2 times 9 dw 0
	;n1 db '1'
	;n2 db '1'
	n1 db 2
	n2 db 7
	count dw 0
	msg2 db 'Type value: ', 0xa
	len2 equ $- msg2
	;my_table times 10 dw 0
	;Direct (direct) addressing
	my_table times 10 db 0

segment .bss
	num1 resb 3
	num2 resb 3
	num3 resb 3
	num4 resb 3
	num5 resb 3
	num6 resb 3


section	.text
  global _start ; должно быть объявлено для линкера (gcc)

_start:	       ; сообщаем линкеру точку входа
	mov ax, 8h
	and ax, 1




  mov	eax,1									; номер системного вызова (sys_exit)
  int	0x80     							; вызов ядра



