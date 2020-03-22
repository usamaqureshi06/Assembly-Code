s1: DC "ENTER a word : "
s2: DC "IS a palindrome.\0"
s3: DC "NOT a palindrome.\0"
s4: DC " "
s5: DC " "


STACK: EQU 0x100000
lui sp,STACK>>12

addi x5,x0,s1
ecall x0,x5,4
ecall x8,x5,8  ;input word

sd x8,s4(x0)
addi x4,x4,0 ;counter
addi x3,x3,0

;;pushing characters in stack
loop:
addi a2,x3,s4
lb x6,0(a2)
beq x6,x0,check
sd x6,0(sp)

ecall x0,x6,3

addi sp,sp,-8
addi x3,x3,1
addi x4,x4,1
bne x6,x0,loop

check:
;;checking loop if its palindrome

addi x3,x0,0
addi x0,x0,0
sd x8,s5(x0)
addi x6,x6,0

check2:
addi a1,x3,s5
lb x7,0(a1)

addi x3,x3,1

;ecall x0,x7,0

addi sp,sp,8
ld x9,0(sp)

;ecall x0,x9,0

addi x4,x4,-1
beq x4,x0,palindrome
beq x9,x7,check2

palindrome:
bne x4,x0,not
addi x5,x0,s2
ecall x0,x5,4
ebreak x0,x0,0

not:
addi x5,x0,s3
ecall x0,x5,4
ebreak x0,x0,0

