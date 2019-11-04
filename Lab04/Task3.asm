
        .MODEL SMALL
.DATA

STR DB "?"
STR2 DB 3 DUP(?)
STR3 DB "***********"


.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
       
        MOV CX,5
        
        L1:
        
        MOV AH, 9
        LEA DX, STR3
        INT 21H
        
        MOV AH,2
        
        
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        LOOP L1:
        
        ;MOV DX,0
       ; MOV CX,DX  
        
        MOV CX ,6
        L2:
        
        MOV AH, 9
        LEA DX, STR3
        INT 21H
        
        MOV AH,2
        ;INT 21H
        
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        LOOP L2:

        
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    END MAIN
