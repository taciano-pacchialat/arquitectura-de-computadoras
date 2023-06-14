.data
A: .word 1
B: .word 2
C: .word 2
resultado: .word 0
.code
ld r1, A(r0)
ld r2, B(r0);
ld r3, C(r0)
dadd r5, r0, r0 #contador en r5
dadd r4, r0, r0
dsub r4, r1, r2
jal verificar
dsub r4, r2, r3
jal verificar
dsub r4, r1, r3
jal verificar
sd r5, resultado(r0)
halt



verificar: bnez r4, no_sumar
daddi r5, r0, 1
no_sumar: jr r31



