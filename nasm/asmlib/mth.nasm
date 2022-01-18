;format ELF32 ; for fasm


global factorial		;public factorial ;for fasm also
global fibonacci		;public fibonacci
global gcd					;public gcd


section .factorial
; rax = input
; output 
; rax = output
factorial:
	push edx
	push ebx
	mov ebx, eax
	mov eax, 1
	.next_iter:
		cmp ebx, 1
		jle .close
		mul ebx
		dec ebx
		jmp .next_iter
	.close:
		pop ebx
		pop edx
		ret

section .fibonacci
fibonacci:
; input
; rax = number
; output 
; rax = number
	push ebx
	push ecx

	mov ecx, eax
	mov eax, 0
	mov ebx, 1
	cmp ecx, 0
	je .next_step
	
	.next_iter:
		cmp ecx, 1
		jle .close

		push ebx     ; save into stack first value ebx
		add eax, ebx ; save summu amounts first two number into eax
		mov ebx, eax ; save eax into ebx

		pop eax      ; save ebx into eax
		dec ecx
		jmp .next_iter
	.next_step:
		xor ebx, ebx

	.close:
		mov eax, ebx
		pop ecx
		pop ebx
		ret
		

; gcd(a, 0)
; gcd(a, b) = gcd(b, a mod b)
section .gcd
gcd:
	; input
	; eax = number1
	; ebx = number2
	; output
	; eax = number
	push ebx
	.next_iter:
		cmp ebx, 0
		je .close

		xor edx, edx ; ecx <=== null
		div ebx ; after div result writed into edx

		push ebx
		mov ebx, edx ; write balance
		pop eax ; write ebx into eax

		jmp .next_iter

	.close:
		pop ebx
		ret

