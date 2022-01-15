%macro print 2 
	pusha

	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
	
	popa
%endmacro

extern exit
extern print_number
extern gcd
extern fibonacci
extern factorial

section	.data
	;msg db 'The Sum is:',0xa	
	msg db 'Hello world bitch'
	len equ $ - msg			

	filename db 'file.txt'
	_buffer.size equ 20


section .bss
	ss1 resb 4
	;ss2 rb 4 not work only fast !!!!!!!!!!!!!
	ss2 resb 2
	res resb 4
	r resb 1

	_buffer resb _buffer.size
	_bss_char resb 1

section	.text
	extern printf, strcmp
	global _start
  ;global main					;must be declared for using gcc

_start:	                ;tell linker entry point
	;mov eax, msg ;; into eax a msg
	;mov eax, 8
	;mov ebx, filename
	;mov ecx, 0777
	;int 0x80


	;mov [r], eax
	;;add [r], byte '0'
	;;print r, 1


	;mov eax, 4
	;mov ebx, [r]
	;mov ecx, msg
	;mov edx, len
	;int 0x80

	;mov eax, 6
	;mov ebx, [r]
	;int 0x80

    
	
	;mov eax, 573432981
	;mov ebx, _buffer
	;mov ecx, _buffer.size
	;call number2string;; print number
	;mov eax, _buffer
	;call print_string
	;print _buffer, _buffer.size
	;call string2number ;; into eax a number
	;call number2string;; print number

	;mov esi, 0
	;mov eax, msg
	;add [msg+4], '0'

	;mov eax, 4
	;mov ebx, 1
	;mov ecx, dword [msg+4] 
	;mov edx, 1
	;int 0x80

	;mov eax, 6
	;mov ebx, _buffer
	;mov ecx, _buffer.size
	;call number2string

	;print _buffer, _buffer.size
	

	;mov eax, 12
	;add eax, 34
	;mov ebx, 23
	;imul eax, ebx
	;div ebx
	;mov eax, [al]
	;add [ss1], eax
	;add [ss1], byte '0'
	;print ss1, 4




	;call number2string
	;print _buffer, _buffer.size






	


	;xor dl, dl
	;xor edx, edx 

	;l1:
	;mov eax, [msg+edx]
	;cmp eax, byte 0 
	;je l2
	;mov [r], eax
	;pusha 
	;print r, 1
	;popa 

	;;mov [r], byte 0xa
	;;pusha
	;;print r, 1
	;;popa
	mov eax, 10 
	mov ebx, 45
	call gcd
	;call factorial
	;call fibonacci
	call print_number
	;mov ebx, _buffer
	;mov ecx, _buffer.size
	;call number2string
	;
	;print _buffer, _buffer.size
	;mov eax, '0'
	;mov [ss1], eax
	;print ss1, 4



	;inc edx
	;jmp l1
	;l2:
	call exit




