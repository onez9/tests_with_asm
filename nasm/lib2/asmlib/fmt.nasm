;global print
global print_number

extern msg
extern len

;section .print_number
print_number:
	push rax
	push rbx
	push rcx
	push rdx

	; amount iterations that happens into first loop 
	xor rcx, rcx

	.next_iter:
		mov rbx, 10 ; mov ebx 10
		xor rdx, rdx ; mov null edx
		div rbx ; div on ebx eax
		add rdx, '0' ; convert to asci
		push rdx ; res push into stack
		inc rcx ; ecx++ 

		cmp rax, 0 ; if rax which is division result == 0
		je .print_iter ; if eax == 0

		jmp .next_iter
	.print_iter:
		cmp rcx, 0
		je .close
		push rcx ; that no erace increments

		push rdi
		push rsi
		push rdx

		mov rax, 1
		mov rdi, 1
		lea rsi, [rsp+8*4]
		mov rdx, 8
		syscall

		pop rdx
		pop rsi
		pop rdi

		pop rcx ; that no erace increments

		add rsp, 8
		dec rcx
		jmp .print_iter
		
	.close:

		mov rax, 4
		mov rbx, 1
		mov rcx, msg
		mov rdx, len
		;syscall
		int 80h

		;print byte '\n', 1
		pop rdx
		pop rcx
		pop rbx
		pop rax
		ret



