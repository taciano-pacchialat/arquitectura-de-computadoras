ORG 1000H
; VERIFICA QUE LETRA SEA UNA VOCAL
CADENAVOCALES DB "aeiouAEIOU"
CORTE DB ?
CADENA DB "paralelepipedo"
CORTECADENA DB ?

ORG 3000h

ES_VOCAL: PUSH AX; DIRECCION DE CARACTER POR DX
PUSH BX; RESULTADO POR DL
PUSH CX

MOV CX, OFFSET CADENAVOCALES
MOV BX, DX
MOV AL, [BX]; LETRA EN AL
MOV BX, CX; OFFSET VOCALES EN BX
MOV AH, OFFSET CORTE - OFFSET VOCALES; AH CANTIDAD DE COMPARACIONES

LAZO: CMP [BX], AL
JZ FINTRUE
DEC AH
JZ FINFALSE
INC BX
JMP LAZO

FINFALSE: MOV DL, 000H
POP CX
POP BX
POP AX
RET

FINTRUE: MOV DL, 0FFH
POP CX
POP BX
POP AX
RET

;CUENTA LA CANTIDAD DE vocles DE UNA CADENA DE CHARS
;REFERENCIA A LA CADENA POR DX
VOCALES: PUSH AX
PUSH BX
PUSH CX

MOV AL, OFFSET CORTECADENA - OFFSET CADENA ;AL CANTIDAD DE RECORRIDOS
MOV AH, 0; AH CONTADOR 

LAZO2: CMP AL, 0
MOV CX, DX; COPIA DX A CX PARA NO PERDER DIRECCION EN EL CALL
CALL ES_VOCAL
CMP DL, 0FFH
JNZ NOVOCAL
INC AH
NOVOCAL: DEC AL
JZ FIN
INC CX
MOV DX, CX
JMP LAZO2

FIN: MOV DL, AL 
POP CX
POP BX
POP AX
RET

ORG 2000H

MOV DX, OFFSET CADENA
CALL VOCALES

HLT
END










