format ELF64
public _start

section '.bss' writeable
	bss_char1 rb 1
	buffer1_size rb 3
	buffer1 equ buffer1_size

section '.data' writeable
	msg db 'Введите число: ', 0
	msglen=$-msg


	buffer_size equ 20
	buffer rb buffer_size

	_buffer_number_size equ 21
	_buffer_number rb _buffer_number_size

	filename db "test_file.txt", 0
	datas db 'Hello Wordl!!!', 0xa, 0
	datas_size=$-datas-1

include 'lib64lin/fmt.inc'
include 'lib64lin/mth.inc'
include 'lib64lin/str.inc'
include 'lib64lin/sys.inc'

section '.text' executable
_start:
	; mov rax, msg
	; mov rbx, msglen
	; call print_string

	; mov rax, buffer
	; mov rbx, buffer_size
	; call input_string
	; call print_string

	; mov rax, _buffer_number
	; mov rbx, _buffer_number_size
	; call input_number
	; call print_number
	; call print_line

	; mov rax, filename
	; mov rbx, 0777o
	; call fcreate


	mov rax, filename
	mov rbx, 2
	call fopen


	; mov rbx, datas
	; mov rcx, datas_size
	; call fwrite

	mov rbx, buffer1
	mov rcx, buffer1_size-1
	call fread
	push rax
	mov rax, buffer1
	call print_string
	pop rax

	mov rbx, buffer1
	mov rcx, buffer1_size-1
	call fread
	push rax
	mov rax, buffer1
	call print_string
	pop rax

	mov rbx, buffer1
	mov rcx, buffer1_size-1
	call fread
	push rax
	mov rax, buffer1
	call print_string
	pop rax

	call fclose
	; mov rax, filename
	; call fdelete


	call exit