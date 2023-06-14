.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
cero: .asciiz "cero"
uno: .asciiz "uno "
dos: .asciiz "dos "
mensaje: .asciiz "numero: "

.text
ld $s6, CONTROL($zero)
ld $s7, DATA($zero)

jal ingreso
beqz $v0, fin2
dadd $a1, $zero, $v1
jal muestra
fin2: halt



; v0 = 1 si es numero
; v1 = numero
ingreso:
  daddi $t0, $zero, 6
  sd $t0, 0($s6) ; limpio pantalla

  daddi $t0, $zero, mensaje
  sd $t0, 0($s7)
  daddi $t0, $zero, 4
  sd $t0, 0($s6) ; imprimo el mensaje

  daddi $t0, $zero, 9
  sd $t0, 0($s6) ; leo el numero
  lbu $v1, 0($s7) ; lo almaceno en v1

  slti $t0, $v1, 58 ; 1 en t0 si es menor a 58
  beqz $t0, noEsNumero ; si no es menor, no es numero
  slti $t0, $v1, 48 ; 1 en t0 si es menor a 48
  bnez $t0, noEsNumero ; si es menor, no es numero

  daddi $v1, $v1, -48
  daddi $v0, $zero, 1

  j fin

  noEsNumero: daddi $v0, $zero, 0
  fin: jr $ra

; por a1 el numero
muestra: 
  daddi $t1, $zero, 0 ; t1 = numeros para comparar
  daddi $t2, $zero, cero ; t2 = direc de strings

  ; voy aumentando t2 en 8 para avanzar en los strings
  ; asumo que siempre entra un numero que este en en data
  loop: beq $a1, $t1, imprimir
  daddi $t2, $t2, 8
  daddi $t1, $t1, 1 ; voy desplazandome hasta que lo encuentre
  j loop

  imprimir: sd $t2, 0($s7) ; mando direc de string a DATA
  daddi $t0, $zero, 4 ; para mandar a CONTROL
  sd $t0, 0($s6) ; imprimo el string

jr $ra



