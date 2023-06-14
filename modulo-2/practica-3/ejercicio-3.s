.data
CONTROL: .word 0x10000
DATA: .word 0x10008
mensaje: .asciiz "el resultado es: "

.text
ld $s6, CONTROL($zero)
ld $s7, DATA($zero)

jal ingreso
beqz $v0, fin2
daddi $a0, $zero, $v1 ; en a0 el primer numero
jal ingreso
beqz $v0, fin2
daddi $a1, $zero, $v1 ; en a1 el otro numero
jal resultado
halt



; en a0 numero 1
; en a1 numero 2
; imprime en terminal la suma de ambos
resultado: 
  daddi $t0, $zero, mensaje
  sd $t0, 0($s7)
  daddi $t0, $zero, 4
  sd $t0, 0($s6) ; imprimo el mensaje
  dadd $a0, $a0, $a1 ; sumo los numeros
  daddi $t0, $zero, 1 
  sd $a0, 0($s7) ; mando la suma a DATA
  sd $t0, 0($s6) ; mando el 1 para imprimir enteros
jr $ra


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