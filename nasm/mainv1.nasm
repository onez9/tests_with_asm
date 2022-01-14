%macro print 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2

	int 80h
%endmacro


section anime
	msg3j1 db 'werwr123'
	len3j1 equ $ - msg3j1
	
section anime 
	msgj1 db 'werwr'
	lenj1 equ $ - msgj1

section	.data
	;msg db 'The Sum is:',0xa	
	msg db '324123', 0
	len equ $ - msg			

section .bss
	ss1 resb 4
	;ss2 rb 4 not work only fast !!!!!!!!!!!!!
	ss2 resb 2
	res resb 4

section	.text
	extern printf, strcmp
	global _start
  ;global main					;must be declared for using gcc

_start:	                ;tell linker entry point

	;mov eax, 3
	;mov ebx, 1
	;mov ecx, 

	mov eax, msg ;; into eax a msg
	call string2number ;; into eax a number


	call print_number ;; print number
	call exit

string2number:

	push ebx
	push ecx
	push edx

	xor ebx, ebx
	xor ecx, ecx

	.next_iter:
		cmp [eax+ebx], byte 0
		je .next_step

		mov cl, [eax+ebx]
		sub cl, '0'
		push ecx
		inc ebx
		jmp .next_iter
	.next_step:
		mov ecx, 1
		xor eax, eax
	.to_number:
		cmp ebx, 0
		je .close
		pop edx
		imul edx, ecx
		imul ecx, 10
		add eax, edx
		dec ebx
		jmp .to_number
	.close:
		pop edx
		pop ecx
		pop ebx

		ret



print_number:
	push eax
	push ebx
	push ecx
	push edx

	; amount iterations that happens into first loop 
	xor ecx, ecx

	.next_iter:
		mov ebx, 10 ; mov ebx 10
		xor edx, edx ; mov null edx
		div ebx ; div on ebx eax
		add edx, '0' ; convert to asci
		push edx ; res push into stack
		inc ecx ; ecx++ 

		cmp eax, 0
		je .print_iter ; if eax == 0

		jmp .next_iter
	.print_iter:
		;print msg, len

		cmp ecx, 0
		je .close

		pop eax
		mov [ss1], eax
		push ecx ; that no erace increments
		print ss1, 4
		pop ecx ; that no erace increments
		dec ecx
		jmp .print_iter
		
	.close:
		mov [ss2], byte 0xa 
		print ss2, 2

		;print byte '\n', 1
		pop edx
		pop ecx
		pop ebx
		pop eax
		ret

exit:
	xor eax, eax
	inc eax
	xor ebx, ebx
  int	0x80	        		;call kernel
