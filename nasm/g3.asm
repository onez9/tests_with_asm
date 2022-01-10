%macro www 2

	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro



section	.data
	msg db 'The Sum is:',0xa	
	len equ $ - msg			

	num1 db '12345'
	num2 db '23456'
	sum db '     '
section .bss
	ss1 resb 3

section	.text
  global _start					;must be declared for using gcc

_start:	                ;tell linker entry point
  ;mov     esi, 4				;pointing to the rightmost digit
  ;mov     ecx, 5       	;num of digits
  ;clc

	push 1
	push 2
	push 3
	push 4

	;mov sp, 10
	;loop1:
	;www ss1, 3


	;dec sp
	;jnz loop1

	pop ebx

	add ebx, '0'

	mov [ss1], ebx
	www ss1, 3

	mov sp, 10
	loop1:
	www msg, len


	dec sp
	jnz loop1

	pop ebx
	add ebx, '0'
	mov [ss1], ebx
	www ss1, 3

	pop ebx
	add ebx, '0'
	mov [ss1], ebx
	www ss1, 3

	pop ebx
	add ebx, '0'
	mov [ss1], ebx
	www ss1, 3

	


	;add_loop:  
  ;dec	esi
  ;loop	add_loop
  ;mov	edx,len						;message length
  ;mov	ecx,msg						;message to write
  ;mov	ebx,1							;file descriptor (stdout)
  ;mov	eax,4							;system call number (sys_write)
  ;int	0x80							;call kernel
  ;mov	edx,5							;message length
  ;mov	ecx,sum						;message to write
  ;mov	ebx,1							;file descriptor (stdout)
  ;mov	eax,4	        		;system call number (sys_write)
  ;int	0x80	        		;call kernel
	;
  mov	eax,1							;system call number (sys_exit)
	mov ebx, 66
  int	0x80	        		;call kernel
;section	.text
;   global _start        ;must be declared for using gcc
;_start:	                ;tell linker entry point
;   ;mov     esi, 4       ;pointing to the rightmost digit
;   ;mov     ecx, 5       ;num of digits
;	 mov ah, '8'
;	 mov [ss1], ax
;	 mov eax, 4
;	 mov ebx, 1
;	 mov ecx, ss1
;	 mov edx, 1
;	 int 0x80
;
;
;   ;clc
;	 mov eax, 1
;	 int 0x80
;
;
;add_loop:  
;   mov 	al, [num1 + esi]
;   adc 	al, [num2 + esi]
;   aaa
;   pushf
;   or 	al, 30h
;   popf
;	
;   mov	[sum + esi], al
;   dec	esi
;   loop	add_loop
;	
;   mov	edx,len	        ;message length
;   mov	ecx,msg	        ;message to write
;   mov	ebx,1	        ;file descriptor (stdout)
;   mov	eax,4	        ;system call number (sys_write)
;   int	0x80	        ;call kernel
;	
;   mov	edx,5	        ;message length
;   mov	ecx,sum	        ;message to write
;   mov	ebx,1	        ;file descriptor (stdout)
;   mov	eax,4	        ;system call number (sys_write)
;   int	0x80	        ;call kernel
;	
;   mov	eax,1	        ;system call number (sys_exit)
;   int	0x80	        ;call kernel
;
;section	.data
;msg db 'The Sum is:',0xa	
;len equ $ - msg			
;num1 db '12345'
;num2 db '23456'
;sum db '     '
