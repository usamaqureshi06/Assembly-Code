s0: DC "Enter value of a:"
s1: DC "Enter value of x:"


;fld f1,a(x0)

addi x5,x0,s0
ecall x1,x5,4
ecall x6,x0,5

addi x5,x0,s1
ecall x1,x5,4
ecall x7,x0,5


fcvt.d.l f3,x6    ; converting from register to memory
fcvt.d.l f4,x7

flt.d x1,f3,f4  ; less than check




