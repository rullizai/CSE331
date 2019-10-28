.MODEL SMALL
.DATA

STR DB "*$"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV CX, 1
      
        
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
        
        MOV CX,2
      
        
        L2:
        
        MOV AH, 9
        LEA DX, STR
        INT 21H
        
        MOV AH,2
        ;INT 21H
        
        
        
       
        
        LOOP L2: 
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        
        MOV CX,3 
        
        L3:
        
       
        
        MOV AH, 9
        LEA DX, STR
        INT 21H
        
        MOV AH,2
        ;INT 21H
        
        
        
       
        
        LOOP L3: 
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
                
                
        MOV CX,4 
        
        L4:
        
       
        
        MOV AH, 9
        LEA DX, STR
        INT 21H
        
        MOV AH,2
        ;INT 21H
        
        
        
       
        
        LOOP L4: 
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H  
        
        
        MOV CX,5 
        
        L5:
        
       
        
        MOV AH, 9
        LEA DX, STR
        INT 21H
        
        MOV AH,2
        ;INT 21H
        
        
        
       
        
        LOOP L5: 
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
         
        
       
        
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    END MAIN