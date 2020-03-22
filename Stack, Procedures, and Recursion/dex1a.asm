s1: DC "Enter an unsigned integer:\0"

s2: DC "Binary representation: "

STACK: EQU 0x100000
lui sp,STACK>>12

addi x4,x4,2

addi x5,x0,s1
ecall x1,x5,4
ecall x5,x0,5

addi x6,x0,0 

loop:

rem x7,x5,x4
div x5,x5,x4
sd x7,0(sp)
addi sp,sp,-8
addi x6,x6,1
bne x5,x0,loop

addi x5,x0,s2
ecall x1,x5,4

loop2:
addi sp,sp,8
ld x8,0(sp)
addi x6,x6,-1
ecall x1,x8,0
bne x6,x0,loop2