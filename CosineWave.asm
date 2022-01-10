MACRO $PRINTLINEV
            
            PUSH CX 
            
            MOV AH, 02H
            MOV BH, 00H
            MOV DH, CONT    
            MOV DL, 40D    
            INT 10H
             
            MOV AL, 0B3H  
            MOV BL, 00011111B
            MOV BH, 00B  
            MOV CX, 0001H  
            MOV AH, 09H
            INT 10H     
ENDM 

MACRO $PRINTLINEH  
    
            PUSH CX 
            
            MOV AH,02H
            MOV BH, 00H
            MOV DH, 12D
            MOV DL, CONT    
            INT 10H  
            
            MOV AL, 0C4H 
            MOV BL, 00011111B
            MOV BH, 00B
            MOV CX, 0001H
            MOV AH, 09H  
            INT 10H   
ENDM  

MACRO HIGHLEFT Wave
            
    XOR AX, AX
    
    MOV AL, MIDDLEHIGH
    SUB AL, Wave
    PUSH DX
    MOV DH, AL
    MOV DL, CONT
    MOV AH, 02H
    MOV BH, 00H
    INT 10H
    POP DX
    PUSH CX
    MOV AH, 09H
    MOV AL, 02FH
    MOV BH, 00H
    MOV BL, 00011100B
    MOV CX, 01H
    INT 10H
    POP CX 
    
ENDM  

MACRO HIGHRIGHT Wave
        
    XOR AX, AX
    
    MOV AL, MIDDLEHIGH
    SUB AL, Wave
    MOV DH, AL
    MOV DL, CONT
    MOV AH, 02H
    MOV BH, 00H
    INT 10H
    
    PUSH CX
    MOV AH, 09H
    MOV AL, 05CH
    MOV BH, 00H
    MOV BL, 00011100B
    MOV CX, 01H
    INT 10H
    POP CX
    
ENDM

MACRO HIGHTOP Wave
        
    XOR AX, AX
    
    MOV AL, MIDDLEHIGH
    SUB AL, Wave
    MOV DH, AL
    MOV DL, CONT
    MOV AH, 02H
    MOV BH, 00H
    INT 10H
    
    PUSH CX
    MOV AH, 09H
    MOV AL, 0DCH
    MOV BH, 00H
    MOV BL, 00011100B
    MOV CX, 01H
    INT 10H
    POP CX
    
ENDM

MACRO DOWNTOP Wave
        
    XOR AX, AX
    
    MOV AL, MIDDLEHIGH
    ADD AL, Wave
    MOV DH, AL
    MOV DL, CONT
    MOV AH, 02H
    MOV BH, 00H
    INT 10H
    
    PUSH CX
    MOV AH, 09H
    MOV AL, 0DFH
    MOV BH, 00H
    MOV BL, 00011100B
    MOV CX, 01H
    INT 10H
    POP CX
    
ENDM

MACRO DOWNLEFT Wave
        
    XOR AX, AX
    
    MOV AL, MIDDLEHIGH
    ADD AL, Wave
    MOV DH, AL
    MOV DL, CONT
    MOV AH, 02H
    MOV BH, 00H
    INT 10H
    
    PUSH CX
    MOV AH, 09H
    MOV AL, 05CH
    MOV BH, 00H
   MOV BL, 00011100B
    MOV CX, 01H
    INT 10H
    POP CX
    
ENDM

MACRO DOWNRIGHT Wave
        
    XOR AX, AX
    
    MOV AL, MIDDLEHIGH
    ADD AL, Wave
    MOV DH, AL
    MOV DL, CONT
    MOV AH, 02H
    MOV BH, 00H
    INT 10H
    
    PUSH CX
    MOV AH, 09H
    MOV AL, 02FH
    MOV BH, 00H
    MOV BL, 00011100B
    MOV CX, 01H
    INT 10H
    POP CX
    
ENDM

DATA SEGMENT 
    
        HIGH DB 05H, 00D ,01D, 02D, 01D, 00D
        LOW DB 03H,01D, 02D, 01D 
        firstrightwave DB 05H,02D,01D,00D
        firstleftwave DB  05H,02D,01D,00D        
        CONT DB 0 
        MIDDLEHIGH DB 12D 
        NME DB  "PATIL DARSHAN RAJKUMAR$"
        TIT DB   "GRAPHICAL REPRESENTATION OF COSINE WAVE$"   
        REGNO DB "19BCB0007$"
        
DATA ENDS  

STACK SEGMENT        
        DB 150 DUP(0)
STACK ENDS                   

CODE SEGMENT 
    
    MOV AX, @DATA
    MOV DS, AX 
    
    JMP START
    
        PROC HEADING
                MOV AH, 02H
                MOV DH, 21D
                MOV DL, 41D
                MOV BH, 00H
                INT 10H
                
                MOV AH, 09H
                LEA DX, REGNO
                INT 21H 
                      
                MOV AH, 02H
                MOV DH, 22D
                MOV DL, 41D
                MOV BH, 00H
                INT 10H
                
                MOV AH, 09H
                LEA DX, NME
                INT 21H
                
                MOV AH, 02H
                MOV DH, 23D
                MOV DL, 41D
                MOV BH, 00H
                INT 10H
                
                MOV AH, 09H
                LEA DX, TIT
                INT 21H 
                
                RET
                      
       HEADING ENDP
                                                          
    START: 
        
        MOV AH, 06H    
        XOR AL, AL     
        XOR CX, CX     
        MOV DX, 184FH  
        MOV BH, 00011110B    
        INT 10H  
        
        CALL HEADING
       
        MOV CX, 0025D
        MOV BL, 0FH   
        
        MOV CONT, 24D  
      
        C1:
              
        $PRINTLINEV
        DEC CONT 
        POP CX  
                  
        LOOP C1
        MOV CONT, 00H    
        MOV CX, 0080D
        MOV BL, 0FH
        
        C2:
        
        $PRINTLINEH            
        INC CONT
        POP CX
                  
        LOOP C2
           
        $STARTPRINT:
                MOV CONT,40 
                XOR SI,SI
                XOR CX,CX
                MOV CL, 05H
              
              
              LEA SI, firstleftwave
              INC SI
              
              HIGHTOP [SI]
              INC SI
              DEC CONT
              HIGHLEFT [SI]  
              INC SI    
              DEC CONT
              HIGHLEFT [SI]  
              INC SI    
              DEC CONT               
              
              LeftWave: 
                
                    LEA SI, LOW
                    INC SI      
                  
                    DOWNRIGHT [SI]
                    INC SI
                    DEC CONT                                
                    DOWNTOP [SI]
                    INC SI
                    DEC CONT
                    DOWNLEFT [SI]  
                    INC SI    
                    DEC CONT
                    
                    LEA SI, HIGH
                    INC SI  
                    
                    HIGHRIGHT [SI]  
                    INC SI
                    DEC CONT
                    HIGHRIGHT [SI]
                    INC SI                
                    DEC CONT
                    HIGHTOP [SI]
                    INC SI
                    DEC CONT 
                    HIGHLEFT [SI]  
                    INC SI    
                    DEC CONT
                    HIGHLEFT [SI]
                    INC SI 
                    DEC CONT
                    
             LOOP LeftWave
            
                MOV CONT, 40D
                XOR CX,CX
                MOV CL,05H  
                
                LEA SI, firstrightwave
                INC SI
              
               HIGHRIGHT [SI]  
               INC SI    
               DEC CONT
               HIGHRIGHT [SI]  
               INC SI    
               DEC CONT
              
             RightWave:
                    LEA SI, HIGH
                    INC SI
                    HIGHLEFT [SI]  
                    INC SI
                    INC CONT
                    HIGHLEFT [SI]
                    INC SI                
                    INC CONT
                    HIGHTOP [SI]
                    INC SI
                    INC CONT 
                    HIGHRIGHT [SI]  
                    INC SI    
                    INC CONT
                    HIGHRIGHT [SI]
                    INC SI 
                    INC CONT                      
                    LEA SI, LOW
                    INC SI                    
                    DOWNLEFT [SI]
                    INC SI
                    INC CONT                                
                    DOWNTOP [SI]
                    INC SI
                    INC CONT 
                    DOWNRIGHT [SI]  
                    INC SI    
                    INC CONT
                
             LOOP RightWave            
        EXIT: 
HLT
RET
CODE ENDS        