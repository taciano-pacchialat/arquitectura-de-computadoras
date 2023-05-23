.data
base: .double 5.85
altura: .double 13.47
dos: .double 2
resultado: .double 0
.code 
l.d f1, base($zero)
l.d f2, altura($zero)
l.d f3, dos($zero)
mul.d f1, f1, f2
div.d f1, f1, f3
s.d f1, resultado($zero)
halt

