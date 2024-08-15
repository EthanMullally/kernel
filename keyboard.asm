ORG 0x8000
BITS 16

section .text
  global _checkForKeyPress
  global _read 

section .data:
  key: db "" 

_checkForKeyPress:
   MOV AH, 00h
   INT 0x16
   JMP _read

_read:
   EXTERN _displayKey
   MOV AH, 01h
   INT 0x16
   JMP _displayKey
