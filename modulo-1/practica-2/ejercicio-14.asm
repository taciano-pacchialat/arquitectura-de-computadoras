TIMER EQU 10H
PIC EQU 20H
EOI EQU 20H
N_CLK EQU 8
N_F10 EQU 9

ORG 1000H
SEG DB 0
SIGN DB 1; si esta en 1, es para parar
; si esta en 0, es para continuar



ORG 3000H
RUT_CLK: 
  PUSH AX
  MOV AL, 0; reinicio segundos
  MOV [BX], AL; mando a SEGS 0
  OUT TIMER, AL
  MOV AL, 20H
  OUT EOI, AL; aviso que termine de responder a la interrupcion
  POP AX
  IRET

RUT_F10:; en BX direccion de SEG, en CX direccion de SIGN
  PUSH AX
  PUSH BX; direc de SEG en pila
  MOV BX, CX
  MOV DL, [BX]; valor de SIGN en DL
  CMP DL, 1; si hay que pararlo 
  JZ PARAR
  ;si hay que continuarlo
  POP BX
  MOV AL, [BX]; cantidad de segundos anteriores en AL
  PUSH BX
  MOV BX, CX; cambio SIGN 
  MOV DL, 0
  MOV [BX], DL
  POP BX
  OUT TIMER, AL; comienzo el timer
  JMP RETORNAR

  PARAR: 
    POP BX; pop a direc de SEG
    IN AL, TIMER
    MOV [BX], AL; valor anterior del timer en SEG
    PUSH BX
    MOV BX, CX; cambio SIGN
    MOV DL, 1
    MOV [BX], DL
    POP BX
  RETORNAR:
    MOV AL, 020H
    OUT EOI, AL
    POP AX
    IRET
  
ORG 2000H
CLI
MOV AX, RUT_F10; para el vector de interrupciones
MOV BX, 36
MOV [BX], AX
MOV AX, RUT_CLK
MOV BX, 32
MOV [BX], AX
MOV AL, 0FCH; habilito ints de timer y f10
OUT PIC + 1, AL
MOV AL, N_F10; mando al vector la direc del gestor para f10
OUT PIC + 4, AL
MOV AL, N_CLK; le mando tambien la del timer
OUT PIC + 5, AL
MOV AL, 30
OUT TIMER + 1, AL; mando al timer para que pare cada 30seg
MOV AL, 0
OUT TIMER, AL
MOV BX, OFFSET SEG; variable para guardar los segundos
MOV CX, OFFSET SIGN
STI
LAZO: JMP LAZO
HLT
END














