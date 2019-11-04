                  
 .MODEL SMALL
.DATA

STR DB 0,1,2,3,4,5,6,7,8,9

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV CX,10
        
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
