format ELF64

public exit


;absolute .exit
section '.exit' executable
exit:
	mov rax, 60
	xor rdi, rdi
	syscall


