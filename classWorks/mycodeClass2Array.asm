.MODEL SMALL
.DATA
    NUMBER  DB 0, 1, 2, 3, 4, 5
    NUMBER2 DB 4 DUP (?)
    TST     DB 5, 4, 3 DUP (2)

.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    LEA SI, NUMBER ; Loading the address of NUMBER array
    
    MOV AH,2
    INC SI
    MOV DL, [SI]  ; Accessing the NUMBER array 
    ADD DL, 48 
    INT 21H    
     
    ; New Line 
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H  
    
    
    MOV BX, 0     
    MOV DL, [BX]
    ADD DL, 48
    INT 21H 
    
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    MOV DL,[BX+SI]
    ADD DL, 48
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN