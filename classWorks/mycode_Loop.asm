.MODEL SMALL
.DATA

STR DB "HELLO WORLD$"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV CX,6
        
        L1:
        
        MOV AH, 9
        LEA DX, STR
        INT 21H
        
        MOV AH,2
        ;INT 21H
        
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        LOOP L1:
        
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    END MAIN