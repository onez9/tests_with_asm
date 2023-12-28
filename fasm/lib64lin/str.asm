format ELF64
; global string2number
; global number2string ; nasm
public string2number
public number2string



section '.string2number' executable
string2number:

	push rbx
	push rcx
	push rdx

	xor rbx, rbx
	xor rcx, rcx

	.next_iter:
		cmp [rax+rbx], byte 0
		je .next_step

		mov cl, [rax+rbx]
		sub cl, '0'
		push rcx
		inc rbx
		jmp .next_iter

	.next_step:
		mov rcx, 1
		xor rax, rax

	.to_number:
		cmp rbx, 0
		je .close
		pop rdx
		imul rdx, rcx
		imul rcx, 10
		add rax, rdx
		dec rbx
		jmp .to_number

	.close:
		pop rdx
		pop rcx
		pop rbx

		ret


; | input
; rax = number
; rbx = buffer
; rcx = buffer size
section '.number2string' executable
number2string:
	; save these registers into stack (push)
	push rax
	push rbx
	push rcx
	push rdx
	push rsi ; esi register it keep length the beffer

	mov rsi, rcx ; source index <=== ecx
	xor rcx, rcx ; amount iterations that happens into first loop 
	
	.next_iter:
		push rbx
		mov rbx, 10 ; mov ebx 10
		xor rdx, rdx ; mov null edx
		div rbx ; div on ebx eax
		pop rbx

		add rdx, '0' ; convert to asci (balance)
		push rdx ; res push into stack
		inc rcx ; ecx++ ; i++

		cmp rax, 0
		je .next_step; if eax == 0 then jump to .print_iter label otherwise above
		jmp .next_iter

	
	.next_step:		 ; intermediate result
		mov rdx, rcx ; move edx, value of ecx. edx <=== ecx
		xor rcx, rcx ; move ecx, null zero 0. ecx <=== null

	.to_string:
		cmp rcx, rsi ; comparision ecx with max value stack
		je .pop_iter
		cmp rcx, rdx ; if ecx equal null then jump onto .null_char
		je .null_char
		pop rax ; get from stack number and put it into ss1
		mov [rbx+rcx], eax ;; move from eax into _buffer
		inc rcx ; reduce, decreace ecx
		jmp .to_string ; jump onto .print_iter (above)

	.pop_iter: ; pop values from the stack
		cmp rcx, rdx
		je .close
		pop rax
		inc rcx
		jmp .pop_iter
	.null_char:
		 mov rsi, rdx
		
	.close:
		mov [rbx+rsi], byte 0
		pop rsi
		pop rdx
		pop rcx
		pop rbx
		pop rax
		ret

