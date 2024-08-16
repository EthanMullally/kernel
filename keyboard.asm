ORG 0x8000
BITS 16

section .text
  global _checkForKeyPress
  global _read 

_checkForKeyPress:
   MOV AH, 00h
   INT 0x16
   JNZ _read

    ; If there is no key press jump back to _checkForKeyPress
    JZ _checkForKeyPress

_read:
   EXTERN _displayKey
   MOV AH, 01h
   INT 0x16
   JMP _displayKey
