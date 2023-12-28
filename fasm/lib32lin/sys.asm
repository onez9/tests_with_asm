global exit

section exit
exit:
    xor eax, eax
    inc eax
    xor ebx, ebx
    int 0x80       ;call kernel

