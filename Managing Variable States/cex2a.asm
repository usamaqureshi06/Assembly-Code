c: DF 1.21, 5.85, -7.3, 23.1, -5.55
d: DF 3.14, -2.1, 44.2, 11.0, -7.77

result: DF -3.392210E+001


addi x3,x3,5
loop:
fld f1,c(x8)
addi x8,x8,8

fld f2,c(x9)
addi x9,x9,8

fmul.d f2,f2,f1
fadd.d f3,f3,f2

addi x3,x3,-1
bne x3,x0,loop

fsd f3,result(x0)
