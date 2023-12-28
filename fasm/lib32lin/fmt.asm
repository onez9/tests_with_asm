global print_number
global print


section .bss
	_bss_char resb 1
	ss1 resb 4
	;ss2 rb 4 not work only fast !!!!!!!!!!!!!
	ss2 resb 2
	res resb 4
	r resb 1


%macro print 2 
	pusha

	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
	
	popa
%endmacro

;section .print
;print:
;	pusha
;	mov [_bss_char], eax
;
;
;	mov eax, 4
;	mov ebx, 1
;	mov ecx, _bss_char
;	mov edx, 1
;	int 80h
;	
;	popa

section .print_number
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



