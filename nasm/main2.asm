
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
	my_table db 1, 2, 3, 4, 5, 6, 7, 8, 9

segment .bss
	num1 resb 3
	num2 resb 3
	num3 resb 3
	num4 resb 3
	num5 resb 3


section	.text
  global _start ; должно быть объявлено для линкера (gcc)

_start:	       ; сообщаем линкеру точку входа
  ;mov	edx,len  ; длина сообщения
  ;mov	ecx,msg  ; сообщение для вывода на экран
  ;mov	ebx,1    ; файловый дескриптор (stdout)
  ;mov	eax,4    ; номер системного вызова (sys_write)
  ;int	0x80     ; вызов ядра

	mov eax, [n1]
	;sub eax, '0'

	mov ebx, [n2]
	;sub ebx, '0' 

	add eax, ebx
	add eax, '0' ; добавляем '0' для конвертации суммы из десятичной системы в ASCII

	mov [num1], eax ; сохраняем сумму в ячейке памяти num1


	;mov eax, 4; номер системного вызова (sys_write)
	;mov ebx, 1 ; файловый дескриптор (stdout)
	;mov ecx, num1
	;mov edx, 5
	;int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 3
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov ax, '9'
	sub ax, '0'

	mov bl, '2'
	sub bl, '0'

	div bl

	add al, '0'
	mov [num3], al
	add ah, '0'
	mov [num4], ah

	mov eax, 4
	mov ebx, 1
	mov ecx, num3
	mov edx, 3
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, num4
	mov edx, 3
	int 0x80

	;mov al, 100
	;;; loop
	;L20:
	;int 0x80
	;loop L20

	;loop L20
	;jmp L20

	; Этот режим адресации использует арифметические операторы для изменения адреса. 
	; Например, следующие определения определяют таблицы данных:
	;
	; BYTE_TABLE DB  14, 15, 22, 45      ; таблица байтов
	; WORD_TABLE DW  134, 345, 564, 123  ; таблица слов

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov al, [my_table+5]
	add al, '0'
	mov [num5], al

	mov eax, 4
	mov ebx, 1
	mov ecx, num5
	mov edx, 3
	int 0x80

  mov	eax,1    ; номер системного вызова (sys_exit)
  int	0x80     ; вызов ядра



