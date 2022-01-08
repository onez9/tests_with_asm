section	.data
	name db "Zara Ali "

section .bss
	name1 resb 3

section	.text
	global _start     ; должно быть объявлено для линкера




_start:           ;сообщаем линкеру входную точку
	mov	edx,9       ; длина сообщения
	mov	ecx,name    ; сообщение для написания
	mov	ebx,1       ; файловый дескриптор (stdout)
	mov	eax,4       ; номер системного вызова (sys_write)
	int	0x80        ; вызовядра

	mov	[name+1], dword "Nuha"    ; изменяем имя на 'Nuha Ali'
	mov	edx,8       ; длина сообщения
	mov	ecx,name    ; сообщение для написания
	mov	ebx,1       ; файловый дескриптор (stdout)
	mov	eax,4       ; номер системного вызова (sys_write)
	int	80h         ; вызов ядра
	mov	eax,1       ; номер системного вызова (sys_exit)
	int	80h         ; вызов ядра

