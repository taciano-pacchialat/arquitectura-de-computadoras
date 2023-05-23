.data
tabla: .word 2, 3, 4, 5, 6, 7
numero: .word 4
dimension: .word 6
resultado: .word 0

.code
ld $a0, numero($zero)
ld $a1, dimension($zero)
daddi $a2, $zero, 0 # desplazamiento
daddi $v1, $zero, 0

lazo: beqz $a1, fin
jal comparar
j lazo

fin: sd $v1, resultado($zero)
halt

# subrutinas
comparar: ld $t1, tabla($zero)
slt $v0, $a0, $t1 # 1 en v0 si numero es menor a tabla
beqz $v0, retorno
daddi $v1, $v1, 1
retorno: daddi $a1, $a1, -1
daddi $a2, $a2, 8
jr $ra
