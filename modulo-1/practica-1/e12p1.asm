ORG 1000H
NUM DB 00001000B
BIT DB 8H
CANT DB 3H

ORG 3000h

ROTARIZQ:ADD DL, DL   ; ROTA HACIA LA IZQUIERDA
RET 

ROTARDER: DEC DH
LAZO: CALL ROTARIZQ
DEC DH
JNZ LAZO
RET


ORG 2000H
MOV DL, NUM
MOV DH, BIT - CANT
CALL ROTARDER

HLT
END









