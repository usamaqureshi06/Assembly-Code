exp: DC "12+34-*\0"


STACK: EQU 0x100000
lui sp,STACK>>12

addi x5,x0,exp
ecall x0, x5,4

addi x4,x4,0 ;counter
addi x3,x0,0

addi x10,x10,43  ;+
addi x11,x11,42  ;* 
addi x12,x12,44  ;/
addi x13,x13,45  ;-

;;pushing digits in stack

loop:
addi a2,x3,exp
lb x6,0(a2)

beq x6,x0,exit

beq x6,x10,add
beq x6,x11,multiply
beq x6,x12,divison
beq x6,x13,subtract

addi x6,x6,-48

sd x6,0(sp)
addi sp,sp,-8

ecall x0,x6,0


addi x3,x3,1
addi x4,x4,1

bne x6,x0,loop

ebreak x0,x0,0

add:
addi x3,x3,1
addi sp,sp,8
ld x8,0(sp)

addi sp,sp,8
ld x9,0(sp)


add x8,x8,x9

sd x8,0(sp)
addi sp,sp,-8
beq x0,x0,loop

subtract:
addi x3,x3,1
addi sp,sp,8
ld x8,0(sp)

addi sp,sp,8
ld x9,0(sp)


sub x8,x9,x8

sd x8,0(sp)
addi sp,sp,-8
beq x0,x0,loop

divison:
addi x3,x3,1
addi sp,sp,8
ld x8,0(sp)

addi sp,sp,8
ld x9,0(sp)


div x8,x9,x8

sd x8,0(sp)
addi sp,sp,-8
beq x0,x0,loop

multiply:
addi x3,x3,1
addi sp,sp,8
ld x8,0(sp)

addi sp,sp,8
ld x9,0(sp)


mul x8,x8,x9

sd x8,0(sp)
addi sp,sp,-8
beq x0,x0,loop

exit:
ebreak x0,x0,0