BITS 16

_keyboard:
  .loop:  

      ; Check if a key on the keyboard has been pressed
      MOV AH, 1h
      INT 0x16
      CMP AL, 0h
      JE .done 
      JC .decode 

  ; Decode the scan code
  .decode:
      MOV AH, 0h
      INT 0x10  
      JMP .display

  ; Display the character
  .display:
      MOV AH, 0x0E ; ASCII character mode
      MOV BH, 0x0  ; Black
      INT 0x10
 
.done:
    RET
