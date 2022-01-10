DATA SEGMENT
    Arr DB 019H,0BCH,0B0H,007H,001H
    Result DB ?
DATA ENDS

CODE SEGMENT
      ASSUME DS:DATA,CS:CODE
START:

MOV AX, DATA
MOV DS, AX
MOV SI, 0
MOV CX, 04H
MOV AL, [Arr+SI]
INC SI

L1:
    CMP [Arr+SI], AL 
    JNC L2    
    MOV AL, [Arr+SI]
    INC SI
    DEC CX
    JNZ L1
    JZ L3
    
L2:
    INC SI
    DEC CX
    JNZ L1
    
L3:
    MOV Result, AL
    MOV AH, 0H
    MOV DL, 16
    DIV DL
    ADD AX, "00"
    MOV DX, AX
    MOV AH, 02H
    INT 21H
    MOV DL, DH
    MOV AH, 02H
    INT 21H
    MOV AH,4CH
    INT 21H
CODE ENDS
END START