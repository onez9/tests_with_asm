    segment .data     ; or use .rodata for read-only data.
str1    db      "Hello", 0x0
str2    db      "Hellx", 0x0
fmt     db      "Comparison = %d", 0xa, 0x0

segment .text
    global main
    extern strcmp, printf
    default rel             ; RIP-reative addressing for [name] is what you want.

main:
    ; Create a stack-frame, re-aligning the stack to 16-byte alignment before calls
    push rbp
    mov rbp, rsp

    ; Prepare the arguments for strcmp.
    lea rdi, [str1]
    lea rsi, [str2]

    ; Call strcmp, return value is in rax.
    call strcmp

    ; Prepare arguments for printf.
    lea rdi, [fmt]
    mov esi, eax  ; int return value from strcmp -> 2nd arg for printf
    xor eax, eax  ; Indicate no floating point args to printf.

    ; Call printf
    call printf

    ; Return 0 (EXIT_SUCCESS), and destroy the stack frame.
    xor eax, eax
    leave            ; or just pop rbp because RSP is still pointing at the saved RBP
    retl
