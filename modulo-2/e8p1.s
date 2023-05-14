.data
num1: .word 4
num2: .word 3
resultado: .word 0

.code
ld r1, num1(r0)
ld r2, num2(r0)
dadd r3, r1, r0
daddi r2, r2, -1

loop: beqz r2, fin
dadd r1, r1, r3
daddi r2, r2, -1
j loop 

fin: sd r1, resultado(r0)
halt