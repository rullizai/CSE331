.MODEL SMALL
.DATA

    NUM      DW 'Enter A Letter :$'
    NUM2     DB ?
    CHAR     DW 'The Capital is :$'
    STR      DB 'Thank you$'
    
.CODE    

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
                
    ; Printing NUM variable           
    MOV AH, 9
    LEA DX, NUM
    INT 21H   
           
    ; Printing New Line       
    MOV DL, 10
    INT 21H 
    MOV DL, 13
    INT 21H  
    
    ; Storing input into NUM2 variable
    MOV AH,1
    INT 21H
    MOV NUM2, AL
    
    SUB NUM2, 32
           
    ; Printing New Line        
    MOV AH,2
    MOV DL, 10
    INT 21H 
    MOV DL, 13
    INT 21H 
    
    ; Printing CHAR variable
    MOV AH,9 
    LEA DX,CHAR
    INT 21H   
               
    ; Printing NUM2 variable 
    MOV AH,2          
    MOV DL,NUM2
    INT 21H    
            
    ; Printing New Line         
    MOV DL, 10
    INT 21H 
    MOV DL, 13
    INT 21H 
     
     
    
    
    ; Printing STR variable
    MOV AH,9
    LEA DX, STR
    INT 21H  
    
    MOV AH,4CH
    INT 21H
    ENDP

END MAIN