; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;
;     nasm -felf64 hello.asm && ld hello.o && .a.out
; ----------------------------------------------------------------------------------------


section   .data
	message db "Hello, World", 10      ; note the newline at the end/
	len equ $ - message
	answer db "%d", 10, 0
	;message:  db "Hello, World", 10      ; note the newline at the end/

section .text
	global main
	extern printf

exit:
  mov rax, 60                 ; system call for exit
  xor rdi, rdi                ; exit code 0
  syscall                     ; invoke operating system to exit

main:   
	mov ecx, 0
	s1:
		cmp ecx, len
		je exit
		pusha
		mov eax, 4
		mov ebx, 1
		mov ecx, msg
		mov edx, len
		int 0x80
		popa

		inc ecx
	jmp s1
	mov rax, 1                  ; system call for write
  mov rdi, 1                  ; file handle 1 is stdout
  mov rsi, message            ; address of string to output
  mov rdx, len                ; number of bytes
  syscall                     ; invoke operating system to do the write

	;mov rdi, mssage
	mov rdi, answer
	mov rsi, 1
	xor rax, rax
	call printf
	
	call exit

;section '.exit' 
	;ret


