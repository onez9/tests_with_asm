%macro print 2 
	pusha

	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
	
	popa
%endmacro



section	.data
	;msg db 'The Sum is:',0xa	
	msg db 'Hello world', 0
	len equ $ - msg			
	_buffer.size equ 20

section .bss
	ss1 resb 4
	;ss2 rb 4 not work only fast !!!!!!!!!!!!!
	ss2 resb 2
	res resb 4
	r resb 1

	_buffer resb _buffer.size
	_bss_char resb 1

section	.text
	extern printf, strcmp
	global _start
  ;global main					;must be declared for using gcc

_start:	                ;tell linker entry point
	;mov eax, msg ;; into eax a msg
	;mov eax, 573432981
	;mov ebx, _buffer
	;mov ecx, _buffer.size
	;call number2string;; print number
	;mov eax, _buffer
	;call print_string
	;print _buffer, _buffer.size
	;call string2number ;; into eax a number
	;call number2string;; print number

	;mov esi, 0
	;mov eax, msg
	;add [msg+4], '0'

	;mov eax, 4
	;mov ebx, 1
	;mov ecx, dword [msg+4] 
	;mov edx, 1
	;int 0x80

	xor dl, dl
	l1:
	mov al, [msg+edx]
	cmp al, byte 0 
	je l2
	mov [r], eax
	pusha 
	print r, 1
	popa 
	mov [r], byte 0xa
	pusha
	print r, 1
	popa
	inc dl
	jmp l1
	l2:
	call exit




section .string2number
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



section .number2string
; | input
; eax = number
; ebx = buffer
; ecx = buffer size

number2string:
	; save these registers into stack (push)
	push eax
	push ebx
	push ecx
	push edx
	push esi ; esi register it keep length the beffer

	mov esi, ecx ; source index <=== ecx
	xor ecx, ecx ; amount iterations that happens into first loop 
	
	.next_iter:
		push ebx
		mov ebx, 10 ; mov ebx 10
		xor edx, edx ; mov null edx
		div ebx ; div on ebx eax
		pop ebx

		add edx, '0' ; convert to asci (balance)
		push edx ; res push into stack
		inc ecx ; ecx++ ; i++

		cmp eax, 0
		je .next_step; if eax == 0 then jump to .print_iter label otherwise above
		jmp .next_iter

	
	.next_step:		 ; intermediate result
		mov edx, ecx ; move edx, value of ecx. edx <=== ecx
		xor ecx, ecx ; move ecx, null zero 0. ecx <=== null

	.to_string:
		cmp ecx, esi ; comparision ecx with max value stack
		je .pop_iter
		cmp ecx, edx ; if ecx equal null then jump onto .null_char
		je .null_char
		pop eax ; get from stack number and put it into ss1
		mov [ebx+ecx], eax ;; move from eax into _buffer
		inc ecx ; reduce, decreace ecx
		jmp .to_string ; jump onto .print_iter (above)

	.pop_iter: ; pop values from the stack
		cmp ecx, edx
		je .close
		pop eax
		inc ecx
		jmp .pop_iter
	.null_char:
		 mov esi, edx
		
	.close:
		mov [ebx+esi], byte 0
		pop esi
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
