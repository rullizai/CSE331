;MD.ZILLUR RAHMAN
;151 01 57 642

.MODEL SMALL

.DATA  

    STR DB '?$'
    STR1 DB 0AH,0DH,'THE SUM OF '
    NUM1 DB ?
    STR2 DB ' AND '
    NUM2 DB ?
    STR3 DB ' IS '
    RESULT DB ?
    STR4 DB ' $'
    
.CODE

MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
            
    MOV AH,9
    LEA DX,STR
    INT 21H
            
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL, 13
    INT 21H 
 
    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV NUM1,AL
    INT 21H
    MOV NUM2,AL
 
    ADD BL,AL
    SUB BL,48
    MOV RESULT,BL
 
    MOV AH,9
    LEA DX,STR1   
    INT 21H
 
    MOV AH,4CH
    INT 21H
 
    MAIN ENDP

END MAIN