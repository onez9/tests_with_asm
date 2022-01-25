section	.data
	msg db 'Factorial 3 is:',0xa	
	len equ $ - msg			
 
section .bss
	fact resb 1

section	.text
   global _start         ; объявляем для использования gcc
	
_start:                  ; сообщаем линкеру входную точку
 
   mov bx, 3             ; для вычисления факторала числа 3
   call  proc_fact
   add   ax, 30h
   mov   [fact], ax
    
   mov	  edx,len        ; длина сообщения
   mov	  ecx,msg        ; сообщение для вывода на экран
   mov	  ebx,1          ; файловый дескриптор (stdout)
   mov	  eax,4          ; номер системного вызова (sys_write)
   int	  0x80           ; вызов ядра
 
   mov    edx,1          ; длина сообщения
   mov	  ecx,fact       ; сообщение для вывода на экран
   mov	  ebx,1          ; файловый дескриптор (stdout)
   mov	  eax,4          ; номер системного вызова (sys_write)
   int	  0x80           ; вызов ядра
    
   mov	  eax,1          ; номер системного вызова (sys_exit)
   int	  0x80           ; вызов ядра
	
proc_fact:
   cmp   bl, 1
   jg    do_calculation
   mov   ax, 1
   ret
	
do_calculation:
   dec   bl
   call  proc_fact
   inc   bl
   mul   bl        ; ax = al * bl
   ret
 
