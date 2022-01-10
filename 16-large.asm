DATA SEGMENT
    Arr DW 019BCH,0B007H,0B001H
    Result DB ?
DATA ENDS

CODE SEGMENT
      ASSUME DS:DATA,CS:CODE
      
START:
MOV AX, DATA
MOV DS, AX
MOV SI, 0
MOV CX, 02H
MOV AX, [Arr+SI]
ADD SI, 2

L1:
    CMP [Arr+SI], AX 
    JC L2    
    MOV AX, [Arr+SI]
    ADD SI, 2
    DEC CX
    JNZ L1
    JZ L3    
L2:
    ADD SI, 2
    DEC CX
    JNZ L1    
L3:
    MOV Result[0], AL
    MOV Result[1], AH
    MOV AH, 0H
    MOV AL, [Result+1]
    MOV DL, 16
    DIV DL
    ADD AX, "07"
    MOV DX, AX
    MOV AH, 02H
    INT 21H
    MOV DL, DH
    MOV AH, 02H
    INT 21H
    MOV AH, 0H
    MOV AL, [Result+0]
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