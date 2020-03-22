e: DF 2.71828182845904523536
a: DF 1.0

s0: DC "Enter value of n:"

fld f1,a(x0)

addi x5,x0,s0
ecall x1,x5,4
ecall x6,x0,5

addi x4,x4,1
addi x7,x0,2

loop1:
add x5,x0,x7      ; 1!,2!,3!,..n!

loop2:
sub x7,x7,x4
mul x5,x5,x7
bne x7,x4,loop2
addi x7,x7,1
fcvt.d.l f3,x5    ; converting from register to memory
fdiv.d f3,f1,f3
fadd.d f4,f4,f3
beq x6,x7,loop1



