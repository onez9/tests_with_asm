format ELF64 ; for fasm


public factorial		;global factorial ;for nasm also
public fibonacci		;global fibonacci
public gcd					;public gcd

; rax = input
; output 
; rax = output
section '.factorial' executable
factorial:
	push rdx
	push rbx
	mov rbx, rax
	mov rax, 1
	.next_iter:
		cmp rbx, 1
		jle .close
		mul rbx
		dec rbx
		jmp .next_iter
	.close:
		pop rbx
		pop rdx
		ret


; input
; rax = number
; output 
; rax = number
section '.fibonacci' executable
fibonacci:
	push rbx
	push rcx

	mov rcx, rax
	mov rax, 0
	mov rbx, 1
	cmp rcx, 0
	je .next_step
	
	.next_iter:
		cmp rcx, 1
		jle .close

		push rbx     ; save into stack first value ebx
		add rax, rbx ; save summu amounts first two number into eax
		mov rbx, rax ; save eax into ebx

		pop rax      ; save ebx into eax
		dec rcx
		jmp .next_iter
	.next_step:
		xor rbx, rbx

	.close:
		mov rax, rbx
		pop rcx
		pop rbx
		ret
		

; gcd(a, 0)
; gcd(a, b) = gcd(b, a mod b)
section '.gcd' executable
gcd:
	; input
	; rax = number1
	; ebx = number2
	; output
	; eax = number
	push rbx
	.next_iter:
		cmp rbx, 0
		je .close

		xor rdx, rdx ; ecx <=== null
		div rbx ; after div result writed into rdx

		push rbx
		mov rbx, rdx ; write balance
		pop rax ; write rbx into rax

		jmp .next_iter

	.close:
		pop rbx
		ret

