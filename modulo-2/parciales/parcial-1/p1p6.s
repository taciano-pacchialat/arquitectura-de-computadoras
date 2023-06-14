.data
tabla_1: .word 21, 12, 5, 16, 8, 39, 10, 41, 4, 33
tabla_2: .word 32, 24, 15, 32, 17, 28, 11, 20, 44, 21
dim: .word 10
rojo: .byte 255, 0, 0, 0
verde: .byte 0, 255, 0, 0
CONTROL: .word 0x10000
DATA: .word 0x10008

.text
daddi $a0, $zero, tabla_1
ld $a1, dim($zero)
jal MIN_MAX
dadd $s0, $zero, $v0 # s0 = min tabla1
dadd $s1, $zero, $v1 # s1 = max tabla1

daddi $a0, $zero, tabla_2
jal MIN_MAX
dadd $s3, $zero, $v0 # s3 = min tabla2
dadd $s4, $zero, $v1 # s4 = max tabla2

lwu $s5, CONTROL($zero)
lwu $s6, DATA($zero)

daddi $t0, $zero, 7
sd $t0, 0($s5)

lwu $t3, rojo($zero)
sw $t3, 0($s6) # rojo en data
sb $s0, 5($s6) # min tabla 1 en coorX
sb $s4, 4($s6) # max tabla 2 en coorY
daddi $t4, $zero, 5
sd $t4, 0($s5) # imprimo el rojo

lwu $t3, verde($zero)
sw $t3, 0($s6)
sb $s3, 5($s6)
sb $s1, 4($s6)
sd $t4, 0($s5)

halt


# a0 direccion, a1 dim
# retorna en v0 el minimo
# en v1 el maximo
MIN_MAX: dadd $t0, $zero, $a0 # t0 = direccion
dadd $t1, $zero, $a1 # t1 = dim
daddi $v0, $zero, 9999 # v0 = minimo
daddi $v1, $zero, -9999 # v1 = maximo

lazo: ld $t2, 0($t0)
slt $t3, $v1, $t2 # 1 en t3 if v1 < t2
beqz $t3, nomax # si es mayor, modifico maximo
dadd $v1, $zero, $t2
nomax: slt $t4, $t2, $v0 # t4 = 1 if t2 < v0
beqz $t4, nomin # si es menor, modifico minimo
dadd $v0, $zero, $t2
nomin: daddi $t1, $t1, -1
daddi $t0, $t0, 8
beqz $t1, retornar
j lazo

retornar: jr $ra

