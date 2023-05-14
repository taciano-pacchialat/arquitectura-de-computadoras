.data 
a: .word 5
x: .word 2
y: .word 3
resultado: .word 0

.code
ld r1, a(r0)
ld r2, x(r0)
ld r3, y(r0)

loop: beqz r1, fin
dadd r2, r2, r3
daddi r1, r1, -1
j loop

fin: sd r2, resultado(r0)
halt