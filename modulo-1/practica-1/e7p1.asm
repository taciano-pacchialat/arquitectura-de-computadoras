ORG 1000H
NUM1 DB 5H
NUM2 DB 3H

ORG 3000H
MUL: PUSH AX
PUSH BX
PUSH CX

MOV AL, DL
DEC DH

SUMA: ADD DL, AL; RESULTADO EN DL
DEC DH

JNZ SUMA

POP CX
POP BX
POP AX
RET

MUL2: PUSH AX ;PARAMETROS POR CX Y DX
PUSH BX

MOV BX, CX
MOV AL, [BX]; EN AL UNO DE LOS NUMEROS
MOV CX, BX
MOV BX, DX
MOV AH, [BX]; EN AH EL OTRO NUMERO
MOV DX, BX
MOV BL, AL
MOV BH, AH
DEC BH

SUMA2: ADD AL, BL
DEC BH
JNZ SUMA2
MOV BX, CX
MOV [BX], AL; resultado final en AL

POP BX
POP AX
RET

MUL3: PUSH BX
MOV BX, SP
PUSH AX
PUSH CX
PUSH DX

ADD BX, 6
MOV CL, [BX]
ADD BX, 2
MOV CH, [BX]
MOV DH, CH
MOV DL, CL
DEC DH

SUMA3: ADD CH, DL
DEC DH
JNZ SUMA3; RESULTADO EN CH
PUSH CX
;SEGUIR


ORG 2000H
MOV CX, OFFSET NUM1
MOV DX, OFFSET NUM2
CALL MUL2
HLT
END










