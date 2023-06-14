; por alguna razon, cuando se ejecuta con el f4 no funciona,
; pero cuando se hace con f7 si.

.data
CONTROL: .word 0x10000
DATA: .word 0X10008
mensaje: .asciiz "ingrese la clave: "
bienvenido: .asciiz "Bienvenido!"
error: .asciiz "ERROR\n"
clave: .asciiz "HOLA"
entrada: .asciiz "aaaa"

.text
ld $s6, CONTROL($zero)
ld $s7, DATA($zero)

otraVez: daddi $t0, $zero, 0
sd $t0, entrada($zero) ; limpio la direccion de entrada 
jal char
jal verificar
beq $v0, $zero, otraVez
daddi $t0, $zero, 4 ; como corto el loop, la contraseña es correcta
daddi $t1, $zero, bienvenido ; imprimo bienvenido
sd $t1, 0($s7)
sd $t0, 0($s6)
halt


verificar:
  daddi $t0, $zero, 4 ; t0 = dim
  daddi $t6, $zero, clave ; t6 = direc de clave
  daddi $t7, $zero, entrada ; t7 = direc de entrada

  loop2: lbu $t2, 0($t6) ; t2 = char de clave
  lbu $t3, 0($t7) ; t3 = char de entrada
  bne $t2, $t3, noSonIguales ; si no son iguales, salgo
  daddi $t6, $t6, 1 ; agrego al desplazamiento de clave
  daddi $t7, $t7, 1 ; agrego al desplazamiento de entrada
  daddi $t0, $t0, -1 ; resto a la dim
  beq $t0, $zero, sonIguales ; si llegue al final salgo
  j loop2 ; loopeo

  noSonIguales: daddi $t0, $zero, error
  daddi $t1, $zero, 4
  sd $t0, 0($s7)
  sd $t1, 0($s6)
  daddi $v0, $zero, 0
  j fin

  sonIguales: daddi $v0, $zero, 1
fin: jr $ra

char: 
  daddi $t0, $zero, 4 ; t0 = 4 para CONTROL y tambien dim
  daddi $t1, $zero, mensaje
  sd $t1, 0($s7)
  sd $t0, 0($s6) ; imprimo el mensaje

  daddi $t7, $zero, 9 ; 9 = leer ascii
  daddi $t1, $zero, 0 ; para desplazamiento

  loop: sd $t7, 0($s6) ; mando para leer
  lbu $v0, 0($s7) ; paso a v0 el caracter leido
  sb $v0, entrada($t1) ; lo mando a memoria
  daddi $t1, $t1, 1 ; incremento el desplazamiento
  daddi $t0, $t0, -1 ; decremento la dim
  beq $t0, $zero, retorno 
  j loop
retorno: jr $ra