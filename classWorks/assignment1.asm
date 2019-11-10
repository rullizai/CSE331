.MODEL SMALL
.DATA
CHAR DB '?$'
MSG1 DB 'THE $'
MSG2 DB 'SUM $'
MSG3 DB 'OF $'
MSG4 DB ' AND $'
MSG5 DB ' IS $'
NUM1 DB 1 DUP(?) 
NUM2 DB 1 DUP(?)


.CODE
     MOV AX,@DATA
     MOV DS,AX
     
     LEA DX, MSG1
     MOV AH, 9
     INT 21H
     
     
MAIN PROC
    
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN




