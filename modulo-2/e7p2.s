.data
tabla: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
M: .word 4
dimension: .word 10
resultado: .word 0

.code
ld $a0, M($zero)
ld $a1, dimension($zero)
daddi $a2, $zero, 0 # desplazamiento
daddi $v1, $zero, 0 # cantidad de valores mayores a M
lazo: beqz $a1, fin
jal comparar
j lazo

fin: sd $v1, resultado($zero)
halt

# subrutinas
comparar: ld $t1, tabla($a2)
slt $v0, $a0, $t1 # 1 en v0 si M es menor a tabla
beqz $v0, retorno # si M no es menor a tabla, salteo la suma
daddi $v1, $v1, 1

retorno: daddi $a1, $a1, -1 # resto 1 a la dimension
daddi $a2, $a2, 8 # incremento el desplazamiento
jr $ra
