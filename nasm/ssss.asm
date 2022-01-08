
build:     file format elf32-i386


Disassembly of section .text:

08049000 <.text>:
 8049000:	b8 04 00 00 00       	mov    eax,0x4
 8049005:	bb 01 00 00 00       	mov    ebx,0x1
 804900a:	b9 01 a0 04 08       	mov    ecx,0x804a001
 804900f:	ba 15 00 00 00       	mov    edx,0x15
 8049014:	cd 80                	int    0x80
 8049016:	b8 04 00 00 00       	mov    eax,0x4
 804901b:	bb 01 00 00 00       	mov    ebx,0x1
 8049020:	b9 16 a0 04 08       	mov    ecx,0x804a016
 8049025:	ba 19 00 00 00       	mov    edx,0x19
 804902a:	cd 80                	int    0x80
 804902c:	b8 04 00 00 00       	mov    eax,0x4
 8049031:	bb 01 00 00 00       	mov    ebx,0x1
 8049036:	b9 2f a0 04 08       	mov    ecx,0x804a02f
 804903b:	ba 1c 00 00 00       	mov    edx,0x1c
 8049040:	cd 80                	int    0x80
 8049042:	e8 07 00 00 00       	call   0x804904e
 8049047:	b8 01 00 00 00       	mov    eax,0x1
 804904c:	cd 80                	int    0x80
 804904e:	b9 00 01 00 00       	mov    ecx,0x100
 8049053:	51                   	push   ecx
 8049054:	b8 04 00 00 00       	mov    eax,0x4
 8049059:	bb 01 00 00 00       	mov    ebx,0x1
 804905e:	b9 00 a0 04 08       	mov    ecx,0x804a000
 8049063:	ba 01 00 00 00       	mov    edx,0x1
 8049068:	cd 80                	int    0x80
 804906a:	59                   	pop    ecx
 804906b:	66 8b 15 00 a0 04 08 	mov    dx,WORD PTR ds:0x804a000
 8049072:	80 3d 00 a0 04 08 0d 	cmp    BYTE PTR ds:0x804a000,0xd
 8049079:	fe 05 00 a0 04 08    	inc    BYTE PTR ds:0x804a000
 804907f:	e2 d2                	loop   0x8049053
 8049081:	c3                   	ret    

Disassembly of section .data:

0804a000 <.data>:
 804a000:	30 48 65             	xor    BYTE PTR [eax+0x65],cl
 804a003:	6c                   	ins    BYTE PTR es:[edi],dx
 804a004:	6c                   	ins    BYTE PTR es:[edi],dx
 804a005:	6f                   	outs   dx,DWORD PTR ds:[esi]
 804a006:	2c 20                	sub    al,0x20
 804a008:	70 72                	jo     0x804a07c
 804a00a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 804a00b:	67 72 61             	addr16 jb 0x804a06f
 804a00e:	6d                   	ins    DWORD PTR es:[edi],dx
 804a00f:	6d                   	ins    DWORD PTR es:[edi],dx
 804a010:	65 72 73             	gs jb  0x804a086
 804a013:	21 0a                	and    DWORD PTR [edx],ecx
 804a015:	0d 57 65 6c 63       	or     eax,0x636c6557
 804a01a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 804a01b:	6d                   	ins    DWORD PTR es:[edi],dx
 804a01c:	65 20 74 6f 20       	and    BYTE PTR gs:[edi+ebp*2+0x20],dh
 804a021:	74 68                	je     0x804a08b
 804a023:	65 20 77 6f          	and    BYTE PTR gs:[edi+0x6f],dh
 804a027:	72 6c                	jb     0x804a095
 804a029:	64 20 6f 66          	and    BYTE PTR fs:[edi+0x66],ch
 804a02d:	0a 0d 4c 69 6e 75    	or     cl,BYTE PTR ds:0x756e694c
 804a033:	78 20                	js     0x804a055
 804a035:	61                   	popa   
 804a036:	73 73                	jae    0x804a0ab
 804a038:	65 6d                	gs ins DWORD PTR es:[edi],dx
 804a03a:	62 6c 79 20          	bound  ebp,QWORD PTR [ecx+edi*2+0x20]
 804a03e:	70 72                	jo     0x804a0b2
 804a040:	6f                   	outs   dx,DWORD PTR ds:[esi]
 804a041:	67 72 61             	addr16 jb 0x804a0a5
 804a044:	6d                   	ins    DWORD PTR es:[edi],dx
 804a045:	6d                   	ins    DWORD PTR es:[edi],dx
 804a046:	69                   	.byte 0x69
 804a047:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804a048:	67 0a 0d             	or     cl,BYTE PTR [di]

Disassembly of section .bss:

0804a04c <.bss>:
	...
