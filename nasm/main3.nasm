
	xor edx, edx
	l1:
	mov eax, [msg+edx] 

	cmp eax, dword 0 
	je l2

	mov [ss1], eax
	pusha 
	print ss1, 1
	popa 

	;mov [ss1], dword 0xa
	;pusha
	;print ss1, 1
	;popa

	inc edx


	jmp l1
	
	l2:
	call exit
