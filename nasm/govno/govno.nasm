;Live Demo
section   .data
	even_msg  db  'Even Number!' ; сообщение с чётным числом
	len1  equ  $ - even_msg 
		 
	odd_msg db  'Odd Number!'    ; сообщение с нечётным числом
	len2  equ  $ - odd_msg

section .bss
	num1 resb 3

section .text
  global _start          ; должно быть объявлено для использования gcc
	
_start:                  ; сообщаем линкеру входную точку
  mov ax, 8h             ; записываем 8 в регистр AX 
  and ax, 1              ; выполняем операцию AND с AX


  mov eax, 4             
  mov ebx, 1             
  mov ecx, ax
  mov edx, 3          
  int 0x80               

  jz  evnn
  mov eax, 4             ; номер системного вызова (sys_write)
  mov ebx, 1             ; файловый дескриптор (stdout)
  mov ecx, odd_msg       ; сообщение для вывода на экран
  mov edx, len2          ; длина сообщения
  int 0x80               ; вызов ядра
  jmp outprog

evnn:   
  mov ah,  09h
  mov eax, 4             ; номер системного вызова (sys_write)
  mov ebx, 1             ; файловый дескриптор (stdout)
  mov ecx, even_msg      ; сообщение для вывода на экран
  mov edx, len1          ; длина сообщения
  int 0x80               ; вызов ядра

outprog:
  mov eax,1              ; номер системного вызова (sys_exit)
  int 0x80               ; вызов ядра

