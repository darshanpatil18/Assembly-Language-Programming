DATA SEGMENT
DATA1 DB 19H
DATA2 DB 0BCH
DATA3 DB 0B0H
DATA4 DB 07H
DATA5 DW 19BCH
DATA6 DW 0007H
DATA ENDS

CODE SEGMENT
ASSUME CS: CODE, DS: DATA
START: MOV AX, DATA;Initialize Data Segment to point to start of the memory 
MOV DS, AX;Set aside for storing of data
MOV AL, 07H;Copy 07H into 8 bit AL register
MOV AX, 0B007H;Copy 0B007H into 16 bit AX register
MOV BX, AX;Copy the content of AX into BX register (16 bit) 
MOV CL, AL;Copy the content of AL into CL register (8 bit) 
MOV AL, DATA1;Copies the byte contents of Data Segment memory; Location DATA1 into 8 bit AL
MOV AX, DATA5;Copies the word contents of Data Segment memory; Location DATA5 into 16 bit AX
MOV DATA2, AL;Copies the AL content into the Byte contents of Data; Segment memory location DATA2
MOV DATA6, AX;Copies the AX content into the Word contents of Data; Data Segment memory location DATA6
MOV BX, OFFSET DATA5;The 16 Bit offset address of Data Segment memory location; DATA5 is copied into BX
MOV AX, [BX];Copies the word content of Data Segment; Memory location addressed by BX into AX (Register indirect addressing Mode)
MOV DI, 0BCH;Address Element
MOV AX, [BX+DI];Copies the word content of Data Segment; Memory location addressed by BX+DI into AX (Base plus Indirect addressing Mode)
MOV AX, [BX+0007H];Copies the word content of Data Segment;
MOV AL, [DI+5];Register Relative Addressing Mode
MOV AX, [BX+DI+0007H];Copies the Word content of Data Segment; Memory location addressed by BX+DI+0007H Into AX(16 Bit)
MOV AH, 4CH;Exit to DOS with function call 0B0H
INT 21H
CODE ENDS;Assembler stops reading
END START    