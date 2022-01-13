format ELF64

public _start

new_line equ 0xa
msg db "hello, world", new_line, 0

_start:
	mov rax, msg
	call print_string
	call exit

print_string:
	push rax
	push rbx
	push rcx
	push rdx

	mov rcx, rax
	call length_string
	mov rdx, rax
	mov rax, 4
	mov rbx, 1
	int 0x80

	pop rdx
	pop rcx
	pop rbx
	pop rax

	ret ; in order to caller

length_string:
	push rdx
	xor drx, rdx
	.nex_iter:
		cmp [rax+rdx], byte 0
		je .close
		inc rdx
		jmp .nex_iter

	.close
		mov rax, rdx
		pop rdx
		ret


	ret

exit:
	mov rax, 1
	mov rbx, 0
	int 0x80
