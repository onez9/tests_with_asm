FORMAT ELF64
;global print
public print_number
public print_string
public print_char
public print_line
public input_string
public input_number
; extern msg
; extern len
include 'str.inc'
section '.bss' writeable
	bss_char rb 1


section '.print_number' executable
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

		;print byte '\n', 1
		pop rdx
		pop rcx
		pop rbx
		pop rax
		ret


section '.print_string' executable
print_string:
	push rax
	push rbx
	push rcx
	push rdx

	mov rcx, rax
	mov rdx, rbx
	mov rax, 4
	mov rbx, 1
	int 0x80

	pop rdx
	pop rcx
	pop rbx
	pop rax

	ret


section '.print_char' executable
print_char:
	; mov rax, 4
	; mov rbx, 1
	; mov rcx, 'A'
	; mov rdx, 1
	; int 0x80
	push rax
	push rbx
	push rcx
	push rdx


	mov [bss_char], al

	mov rax, 1 ; write
	mov rdi, 1 ; stdout
	mov rsi, bss_char
	mov rdx, 1
	syscall

	pop rdx
	pop rcx
	pop rbx
	pop rax

	ret

section '.print_line' executable
print_line:
	push rax
	mov rax, 0xa
	call print_char
	pop rax
	ret


;rax=buffer
;rbx=buffer_size
section '.input_string' executable
input_string:
	push rax
	push rbx
	push rcx
	push rdx

	push rax

	mov rcx, rax
	mov rdx, rbx
	mov rax, 3 ; read
	mov rbx, 2 ; стандартный потоко ввода
	int 0x80

	pop rbx 
	; mov [rbx+rax-1], byte 0
	mov [rbx+rax-1], byte 0


	pop rdx
	pop rcx
	pop rbx
	pop rax
	ret


section '.input_number' executable
input_number:
	; push rax
	push rbx
	push rcx
	push rdx

	call input_string
	call string2number

	pop rdx
	pop rcx
	pop rbx
	; pop rax
	ret