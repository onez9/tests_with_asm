format ELF64 executable
entry _start

;public _start



new_line equ 0xa
msg db "hello, world!", new_line, 0
len equ $ - msg

_start:
	mov rax, 4 
	mov rbx, 1
	mov rcx, msg
	mov rdx, len
	int 0x80


	xor rax, rax
	inc rax
	xor rbx, rbx 

	int 0x80

;	call print_string
;	call exit

;print_string:
;	push rax
;	push rbx
;	push rcx
;	push rdx
;
;	mov rcx, rax
;	call length_string
;	mov rdx, rax
;	mov rax, 4
;	mov rbx, 1
;	int 0x80
;
;	pop rdx
;	pop rcx
;	pop rbx
;	pop rax
;
;	ret ; in order to caller
;
;length_string:
;	push rdx
;	xor rdx, rdx
;	.nex_iter:
;		cmp [rax+rdx], byte 0
;		je .close
;		inc rdx
;		jmp .nex_iter
;
;	.close:
;		mov rax, rdx
;		pop rdx
;		ret
;
;
;	ret
;
;exit:
;	mov rax, 1
;	mov rbx, 0
;	int 0x80
