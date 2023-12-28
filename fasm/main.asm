format ELF64
public _start


section '.data' writeable
	msg db 'Hello world!', 0xa, 0
	msglen=$-msg

include 'lib64lin/fmt.inc'
include 'lib64lin/mth.inc'
include 'lib64lin/str.inc'
include 'lib64lin/sys.inc'

section '.text' executable
_start:
	mov rcx, msg
	mov rdx, msglen
	call print_string

	call exit