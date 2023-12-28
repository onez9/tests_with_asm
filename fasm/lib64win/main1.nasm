; When set, it instructed the operating system to retain the text 
; segment of the program in swap space after the process exited. 
; This speeds up subsequent executions by allowing the kernel 
; to make a single operation of moving the program from swap to real memory. 
; Thus, frequently-used programs like editors would load noticeably faster.

section .bss
	fd_out resb 4
	res resb 1
	


section .data
	namefale db 'input.txt', 0
	msg db 'Hello world', 0xa
	len equ $ - msg
	l equ 64 - $
	le equ $ - l
	new db 0xa
	sss db 1






section .text
	global _start


_start:
	mov rdx, 0
	mov rbx, msg
	mov rcx, len

	ssss:
	push rdx
	push rcx

	;push rdx
	;push rcx
	;mov rcx, 2
	;sss1:
	;mov rax, 1
	;mov rdi, 1
	;lea rsi, [rbx+rdx]
	;mov rdx, 1
	;syscall
	;loop sss1
	;pop rcx
	;pop rdx

	mov rax, 1
	mov rdi, 1
	lea rsi, [rbx+rdx]
	mov rdx, 1
	syscall

	mov rax, 1
	mov rdi, 1
	lea rsi, [rsi]
	mov rdx, 1
	syscall
	

	mov rax, 1
	mov rdi, 1
	lea rsi, new
	mov rdx, 1
	syscall
	
	pop rcx
	pop rdx
	inc rdx


	loop ssss

	;##################################################################
	;mov rax, 4
	;mov rbx, 1
	;mov rcx, msg
	;mov rdx, len
	;int 0x80
	;syscall ; not work
	;int 0x80 ; work
	;##################################################################

	;add [l], '0'
	;mov eax, 4
	;mov ebx, 1
	;mov ecx, l
	;mov edx, le
	;int 0x80

	;##################################################################
  ;mov rdi, namefale
  ;mov rsi, 0x40 ;0102     ;O_CREAT, man open
  ;mov rdx, 0666o     ;umode_t
  ;mov rax, 2
  ;syscall ; work
  ;int 0x80 ; not work
	;##################################################################

	;##################################################################
	;mov rax, 8
	;mov rbx, namefale
	;mov rcx, 0777o
	;syscall
	;int 0x80 ; wordk
  ;syscall
	;mov rdi,'H' ; function parameter: one char to print

	call exit

exit:
	;mov rax, 60
	;syscall
	xor eax, eax
	inc eax
	mov ebx, 0
	int 0x80







