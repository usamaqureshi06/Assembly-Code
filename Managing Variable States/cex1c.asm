s0: DC "Find all divisors.\0"
s1: DC "Enter i:\0"
s2: DC "Divisors:\0"


addi x5,x0,s0
ecall x0,x5,4 ;output


addi x5,x0,s1
ecall x1,x5,4 ;output

ecall x6,x6,5

addi x5,x0,s2
ecall x0,x5,4 ;output


addi x4,x0,1

loop:

rem x7,x6,x4
beq x7,x0,divisor
add x7,x6,x7
addi x4,x4,1
bne x6,x4,loop
beq x0,x0,end


divisor:
ecall x0,x4,0
addi x4,x4,1
bne x6,x4,loop

end:
ecall x0,x4,0