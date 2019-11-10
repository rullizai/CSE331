.MODEL SMALL

.DATA

    STR DB 'ENTER THRRE INITIALS: $'
    STR1 DB '',0AH,0DH
    FIRST DB ?
    STR2 DB '',0AH,0DH
    SECOND DB ?
    STR3 DB '',0AH,0DH
    THIRD DB ?
    STR4 DB '$' 
    
.CODE

MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    MOV AH,9
    LEA DX,STR
    INT 21H
 
    MOV AH,1
    INT 21H
    MOV FIRST,AL
    INT 21H
    MOV SECOND,AL
    INT 21H
    MOV THIRD,AL
 
    MOV AH,9
    LEA DX,STR1
    INT 21H
 
    MOV AH,4CH
    INT 21H
 
    MAIN ENDP

END MAIN