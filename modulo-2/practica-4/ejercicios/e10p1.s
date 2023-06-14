.data
cadena: .asciiz "adbdcdedfdgdhdid"
caracter: .asciiz "d"
cantidad: .word 0

.code
daddi r1, r0, 0

lbu r4, caracter(r0) # caracter en r4
dadd r6, r0, r0 # cantidad en r6

loop: lbu r2, cadena(r1)
beqz r2, fin
dsub r5, r2, r4
bne r0, r5, nosumar # si la resta no es 0, no sumo
daddi r6, r0, 1
nosumar: daddi r1, r1, 1 # paso al siguiente caracter
daddi r3, r3, -1
j loop

fin: sb r6, cantidad(r0)
halt
