[BITS 16]	                      ;Tells the assembler that its a 16 bit code
[ORG 0x7C00]	                    ;Origin, tell the assembler that where the code will
																	;be in memory after it is been loaded

;MOV AH,00h      ; Set video mode
;MOV AL,03h      ; Mode 3 (Color text)
;INT 10H
mov bx, 0
mov ax, $
push ax


MOV SI, HelloString                 ;Store string pointer to SI
CALL PrintString	                ;Call print string procedure
pop ax
hlt
JMP ax		                        ;Infinite loop, hang it here.


PrintCharacter:	                  ;Procedure to print character on screen
;mov al, 02h											; here we set the 80x25 graphical mode (text)
;mov ah, 00h 											; this is the code of the function that allows us to change the video mode
;int 10h													; here we call the interrupt It was originally published on https://www.apriorit.com/

;sti
;jmp $
;mov al, 21h
inc bx
push bx




;MOV Ah, 06h											; AH=06(scroll up window), AL=00(entire window)
;
;MOV BH, 00010100b    						; left nibble for background (blue), right nibble for foreground (light gray)
;MOV CX, 0000h        						; CH=00(top), CL=00(left)
;MOV DX, 9EEEh        						; DH=19(bottom), D=50(right)
;int 10h
																	;Assume that ASCII value is in register AL
MOV Ah, 0eh	                    ;Tell BIOS that we need to print one charater on screen.
mov bh, 0x01

;MOV BH, 00110100b    							;left nibble for background (blue), right nibble for foreground (light gray)
;MOV CX, 0000h        							;CH=00(top), CL=00(left)
;MOV DX, 9EEEh        							;DH=19(bottom), D=50(right)
INT 0x10	                        ;Call video interrupt
pop bx
RET		                            ;Return to calling procedure



PrintString:	                    ;Procedure to print string on screen
	                                ;Assume that string starting pointer is in register SI

next_character:	                  ;Lable to fetch next character from string
MOV AL, [SI]	                    ;Get a byte from string and store in AL register
INC SI		                        ;Increment SI pointer
inc bx

OR AL, AL	                        ;Check if value in AL is zero (end of string)
JZ exit_function                  ;If end then return
cmp bx, 8

jne .se3
mov al, '0'
MOV Ah, 0eh	                    ;Tell BIOS that we need to print one charater on screen.
mov bh, 0x01
int 0x10

.se3:
CALL PrintCharacter               ;Else print the character which is in AL register
JMP next_character	              ;Fetch next character from string
exit_function:	                  ;End label
RET		                            ;Return from procedure


;Data
;HelloString db 'Hello World',0xd, 0xa, 0	  ;HelloWorld string ending with 0
HelloString db 'Hello World', 0xd, 0xa, 0	  ;HelloWorld string ending with 0
len equ $ - HelloString


TIMES 510 - ($ - $$) db 0	        ;Fill the rest of sector with 0
DW 0xAA55													;Add boot signature at the end of bootloader 
