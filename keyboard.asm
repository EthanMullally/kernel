ORG 0x8000
BITS 16

section .text
 global _start

section .data
    buffer: db 0

_start: 
    .loop:
        ; Check if a key is pressed
        CMP AH, 01h 
        JE .keyPressed
        JC .loop
        INT 0x16
        
    .keyPressed:

        ; Read the key press and store it into a buffer then output the buffer
        MOV AH, 02h
        INT 0x16
        MOV [buffer], AL
        MOV AL, [buffer]
        JMP .output

    .output:
        ; Output the key pressed
        MOV AH, 0x0E ; 0x0E is Teletype which handles ASCII which allows us to view each keypress as it is on the keyboard
        MOV BH, 0x0  ; Page number
        MOV BL, 0x07 ; White text black background
        INT 0x10 
        JMP .loop
