.data
cadena1: .asciiz "Cadena1"
cadena2: .asciiz "Cadena2"
resultado: .word 0

.code
daddi $a0, $zero, cadena1
daddi $a1, $zero, cadena2
jal subrutina
sd $v0, resultado($zero)
halt

subrutina: daddi $v0, $zero, 0
daddi $t2, $zero, 0 # desplazamiento de direcciones en t2

loop: lbu $t0, 0($a0) 
lbu $t1, 0($a1) # cargo los caracteres
beqz $t0, primera_termino
beqz $t1, retornar # la primera seguro no termino, retorno el lugar actual
bne $t0, $t1, retornar # si no son iguales, retorna
daddi $v0, $v0, 1 # se que no son iguales ni terminaron, asi que sigo
daddi $a0, $a0, 1
daddi $a1, $a1, 1
j loop

primera_termino: beqz $t1, son_iguales
j retornar # termino solo la primera, retorno donde difieren 

son_iguales: daddi $v0, $zero, -1
j retornar

retornar: jr $ra
