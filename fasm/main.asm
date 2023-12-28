format ELF64
public _start


section '.data' writeable
	msg db 'Hello world!', 0xa, 0
	msglen=$-msg

	buffer_size equ 20
	buffer rb buffer_size

	_buffer_number_size equ 20
	_buffer_number rb _buffer_number_size


include 'lib64lin/fmt.inc'
include 'lib64lin/mth.inc'
include 'lib64lin/str.inc'
include 'lib64lin/sys.inc'

section '.text' executable
_start:
	mov rax, msg
	mov rbx, msglen
	call print_string

	mov rax, buffer
	mov rbx, buffer_size
	call input_string
	call print_string

	mov rax, _buffer_number
	mov rbx, _buffer_number_size
	call input_number
	call print_number


	call exit