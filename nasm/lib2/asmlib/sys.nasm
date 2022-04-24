global exit

;section exit readable
;absolute .exit
exit:
	mov rax, 60
	xor rdi, rdi
	syscall
