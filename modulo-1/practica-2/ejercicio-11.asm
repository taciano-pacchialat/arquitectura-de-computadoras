; Escribir un programa que permita seleccionar una letra del abecedario al azar. El código de la letra debe generarse en un
; registro que incremente su valor desde el código de A hasta el de Z continuamente. La letra debe quedar seleccionada al
; presionarse la tecla F10 y debe mostrarse de inmediato en la pantalla de comandos
PIC EQU 20H
EOI EQU 20H
N_F10 EQU 10
HEX_A EQU 061H
HEX_Z EQU 07AH
ORG 40
IP_F10 DW RUT_F10
ORG 1000H
PRINT DB ?

ORG 2000H
CLI
MOV AL, 0FEH
OUT PIC + 1, AL; IMR
MOV AL, N_F10
OUT PIC + 4, AL; INT0
MOV CL, HEX_A 
STI

LOOP:
  INC CL
  CMP CL, HEX_Z 
  JNZ LOOP
  JMP REINICIAR

REINICIAR: 
  MOV CL, HEX_A 
  JMP LOOP

ORG 3000H
RUT_F10: 
  PUSH BX
  PUSH AX
  MOV PRINT, CL
  MOV BX, OFFSET PRINT
  MOV AL, 1
  INT 7
  MOV AL, EOI
  OUT EOI, AL; comunico que termino el gestor
  POP AX
  POP BX
  IRET

END