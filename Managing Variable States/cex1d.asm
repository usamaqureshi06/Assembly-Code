s0: DC "Find all divisors.\0"
s1: DC "Enter i:\0"
s2: DC "Divisors:\0"

s3: DC "prime."
s4: DC "not a prime."



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
sd x4,c(x8)
addi x8,x8,8
addi x0,x0,4
addi x4,x4,1
addi x9,x9,1
bne x6,x4,loop

end:

sd x4,c(x8)
addi x9,x9,1

addi x10,x10,2
bne x9,x10,not_prime
addi x5,x0,s3
ecall x0,x5,4 ;output

ebreak x0,x0,0

not_prime:
addi x5,x0,s4
ecall x0,x5,4 ;output
ebreak x0,x0,0

c: DM 1