ASSUME DS:DATA, CS:CODE
DATA SEGMENT
 MSG1 DB 13, 10, "ENTER THE STRING: $"
 MSG2 DB 13, 10, "GIVEN STRING IS: $"
 MSG3 DB 13, 10, "LENGTH OF THE STRING IS: $"
 STR DB 100,?,100 DUP('$')
DATA ENDS
CODE SEGMENT
 START:
 MOV AX,DATA ; LOADING DATA SEGMENT
 MOV DS,AX

 LEA DX, MSG1
 MOV AH, 09 ; INTERRUPT TO PRINT INPUT MESSAGE
 INT 21H
 LEA DX, STR
 MOV AH, 0AH ; INTERRUPT FOR INPUT STRING
 MOV STR, 10
 INT 21H

 LEA DX, MSG2
 MOV AH, 09 ; INTERRUPT TO PRINT MESSAGE
 INT 21H
 LEA DX, STR+2 ; INTERRUPT TO PRINT OUTPUT STRING
 MOV AH, 09
 INT 21H

 MOV CL, STR+1 ; FINDING THE LENGTH
 LEA DX, MSG3
 MOV AH, 09 ; INTERRUPT TO PRINT OUTPUT MESSAGE
 INT 21H

 MOV DL, CL
 ADD DL, 48 ; INTERRUPT TO PRINT STRING LENGTH
 MOV AH, 02H
 INT 21H
 MOV AX,4CH ; INTERRUPT TO TERMINATE PROGRAM
 INT 21H

CODE ENDS
END START