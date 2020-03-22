s0: DC "n! Enter n:"
s1: DC "!="

addi x5,x0,s0
ecall x1,x5,4 ;output
ecall x6,x0,5  ;input

ecall x1,x6,0 ;output without new line
addi x5,x0,s1
ecall x1,x5,4 ;output

addi x4,x0,1
addi x7,x6,0

loop:

sub x6,x6,x4
mul x7,x7,x6

bne x6,x4,loop


ecall x0,x7,0