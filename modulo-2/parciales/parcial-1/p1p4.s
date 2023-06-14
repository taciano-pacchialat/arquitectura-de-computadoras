.data
numero: .double 0
valor: .double 4.2
mensaje: .asciiz "El resultado es: "
resultado: .double 0
control: .word 0x10000
data: .word 0x10008

.code
ld $s0, control($zero)
ld $s1, data($zero)

daddi $t0, $zero, 6 #limpio pantalla
ld $t0, 0($s0)

daddi $t0, $zero, 8 # leo un numero
sd $t0, 0($s0)

l.d f1, 0($s1) # f1 = numero
l.d f2, valor($zero) # f2 = valor

c.lt.d f2, f1
bc1t caso1
j caso2

caso1: sub.d f3, f1, f2 # f3 = numero - valor
mul.d f4, f3, f1 # f4 = f3 * numero
j imprimir

caso2: sub.d f3, f2, f1
div.d f4, f3, f1
j imprimir

imprimir: daddi $t0, $zero, mensaje # direc de mensaje en t0
sd $t0, 0($s1) # imprimo mensaje
daddi $t1, $zero, 4
sd $t1, 0($s0)

s.d f4, 0($s1) # resultado en data
daddi $t0, $zero, 3 # imprimo el flotante 
sd $t0, 0($s0)
