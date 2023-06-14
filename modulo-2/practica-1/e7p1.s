.data
tabla: .word 4, 3, 2, 5
x: .word 5
dim: .word 4
cant: .word 0
nueva_cadena: .word 0

.code
daddi r1, r0, 0 # direcciones en r1
ld r2, x(r0) # x en r2
ld r5, dim(r0) # tamanio de las tablas en r5

loop: ld r3, tabla(r1) # valores de la tabla en r3
slt r4, r2, r3 # 1 en r4 si x es menor que el valor de tabla
dadd r6, r6, r4
sd r4, nueva_cadena(r1)
beqz r5, fin
daddi r5, r5, -1
daddi r1, r1, 8
j loop

fin: sd r6, cant(r0) 
halt