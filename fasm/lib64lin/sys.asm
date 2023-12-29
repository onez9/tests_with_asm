format ELF64

public exit
public fcreate
public fopen
public fread
public fwrite
public fseek
public fclose
public fdelete

;absolute .exit
section '.exit' executable
exit:
	mov rax, 60
	xor rdi, rdi
	syscall

; input: 
; rax - filename; 
; rbx - permissions; 
; output: 
; rax - descriptor
section '.fcreate' executable
fcreate:
	push rbx
	push rcx


	mov rcx, rbx 
	mov rbx, rax
	mov rax, 8		
	int 0x80

	pop rcx
	pop rbx
	ret

; input: 
; rax - filename; 
; rbx mode:
	; rd_only - 0
	; wr_only - 1
; rdwr - 2
; output: 
	; rax - descriptor
section '.fopen' executable
fopen:
	push rbx
	push rcx


	mov rcx, rbx 
	mov rbx, rax
	mov rax, 5		
	int 0x80

	pop rcx
	pop rbx
	ret
	





;input:
;rax-descriptor
;rbx-buffer
;rcx-buffer_size
section '.fread' executable
fread:
	push rax
	push rbx
	push rcx
	push rdx

	push rbx
	push rcx 

	mov rbx, 1
	xor rcx, rcx
	call fseek
	
	pop rcx
	pop rbx

	mov rdx, rcx
	mov rcx, rbx
	mov rbx, rax
	mov rax, 3 ; reed
	int 80h

	pop rdx
	pop rcx
	pop rbx
	pop rax
	ret

;input:
;rax-descriptor
;rbx-buffer
;rcx-buffer_size
section '.fwrite' executable
fwrite:
	push rax
	push rbx
	push rcx
	push rdx

	push rbx
	push rcx 

	mov rbx, 1
	xor rcx, rcx
	call fseek
	
	pop rcx
	pop rbx

	mov rdx, rcx
	mov rcx, rbx
	mov rbx, rax
	mov rax, 4 ; write
	int 80h

	pop rdx
	pop rcx
	pop rbx
	pop rax
	ret



section '.fseek' executable
;input:
;rax=descriptor
;rbx=mode:
;	seek_set=0
;	seek_cur=1
;	seek_end=2
;rcx=position
fseek:
	push rax
	push rbx
	push rdx

	mov rdx, rbx ; put mode to rdx
	mov rbx, rax ; put descriptor to rbx
	mov rax, 19  ; seek

	pop rdx
	pop rbx
	pop rax
	ret




; input: 
; rax - descriptor; 
section '.fclose' executable
fclose:
	push rbx

	mov rbx, rax ; rbx <- descriptor file
	mov rax, 6
	int 0x80

	pop rbx
	ret

; input: 
; rax - filename; 
section '.fdelete' executable
fdelete:
	push rax
	push rbx

	mov rbx, rax ; rbx <- filename
	mov rax, 10
	int 0x80

	pop rbx
	pop rax
	ret