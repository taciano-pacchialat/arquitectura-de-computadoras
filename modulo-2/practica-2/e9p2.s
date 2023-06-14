.data
valor: .word 10
result: .word 0

.text
daddi $sp, $0, 0x400 # Inicializa el puntero al tope de la pila (1)
ld $a0, valor($0)
jal factorial
sd $v0, result($0)
halt

factorial: daddi $s0, $zero, 1
sd $ra, 0($sp) # pusheo ra
daddi $sp, $sp, -8
dadd $v0, $a0, $zero # muevo a0 a v0 para trabajar mas comodo
jal factorialrecursivo
ld $ra, 0($sp) # pop a ra
daddi $sp, $sp, 8
jr $ra
#! queda en un loop infinito
factorialrecursivo: beq $v0, $s0, return # si valor == 1, inicio backtracking
sd $v0, 0($sp) # pusheo el valor actual
daddi $sp, $sp, -8 
daddi $v0, $v0, -1 # decremento valor
sd $ra, 0($sp) # pusheo ra
daddi $sp, $sp, -8

jal factorialrecursivo
ld $t0, 0($sp) # pop a valor 
daddi $sp, $sp, 8
dmulu $v0, $v0, $t0 # multiplico
ld $ra, 0($sp) # pop a ra
daddi $sp, $sp, 8
jr $ra



return: jr $ra