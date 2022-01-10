DATA SEGMENT
X DB 01H, 09H, 0BH, 0CH, 0BH, 00H, 07H
Y DB 07H, 00H, 0BH, 0CH, 0BH, 09H, 01H
DATA ENDS

CODE SEGMENT
ASSUME CS: CODE, DS: DATA
START: MOV AX, DATA; Initialize Data Segment to point to start of the memory 
MOV DS, AX; Set aside for storing of data
MOV CX, 07H; Load the counter
LEA SI, X; SI pointed to the source location X
LEA DI, Y; DI pointed to the destination location Y
UP: MOV BL,[SI] ; Move the SI content to BL register
MOV AL, [DI]; Move the DI content to AL register
MOV [SI], AL; Move AL register content to content of SI
MOV [DI], BL; Move BL register content to content of DI
INC SI; Update SI and DI
INC DI;
DEC CX; Decrement the counter till it becomes zero
JNZ UP
MOV AH, 07H
INT 0B0H
CODE ENDS
END START