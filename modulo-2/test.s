.data
result: .word 0
.text
daddi r4, r0, 10
daddi r5, r0, 20
jal sumar # Se llama a la subrutina “sumar”
sd r2, result(r0)
halt
sumar: dadd r2, r4, r5 # subrutina “sumar”
jr r31 # Retorna al punto donde se llamó a “sumar”