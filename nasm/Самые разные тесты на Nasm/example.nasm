section .data
	text db "hello world"
	len_text equ $- text

section .bss

section	.text
  global _start						; должно быть объявлено для использования gcc
 
_start:										; сообщаем линкеру входную точку
  MOV  AX, 00							; инициализируем регистр AX значением 0
  MOV  BX, 00    					; инициализируем регистр BX значением 0
  MOV  CX, 01    					; инициализируем регистр CX значением 1
  ;L20:
	jg   anime
  ADD  AX, 01							; выполняем инкремент регистра AX
  ADD  BX, AX    					; добавляем AX к BX
  SHL  CX, 1     					; сдвиг влево регистра CX, что, в свою очередь, удваивает его значение

  int   0x80							; вызов ядра

  mov   eax, 1
  int   80h



anime:
	mov eax, 4
	mov ebx, 1
	mov ecx, text
	mov edx, len_text
	;int 0x80
	
