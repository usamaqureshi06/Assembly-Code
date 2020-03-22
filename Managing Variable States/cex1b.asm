s0: DC "sum(1..n-1)Enter n:"
s1: DC "sum(1.."
s2: DC ")="
s3: DC "(n*(n-1))/2="

addi x5,x0,s0
ecall x1,x5,4 ;output
ecall x6,x0,5  ;input


addi x4,x6,-1
addi x5,x0,s1
ecall x1,x5,4 ;output
ecall x1,x4,0 ;output without new line

addi x5,x0,s2
ecall x1,x5,4 ;output



addi x4,x0,1
add x8,x6,x0
sub x6,x6,x4
addi x7,x6,0

loop:

sub x6,x6,x4
add x7,x6,x7

bne x6,x0,loop


ecall x0,x7,0

addi x5,x0,s3
ecall x1,x5,4 ;output

addi x9,x8,-1
mul x8,x8,x9
addi x4,x0,2
div x8,x8,x4
ecall x0,x8,0