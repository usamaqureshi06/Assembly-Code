s1: DC "Enter two positive integers:"
s2: DC "GCD :"


addi x5,x0,s1
ecall x0,x5,4


ecall x5,x0,5  ;x
ecall x6,x0,5  ;y

addi sp, x0, 0 ;sp initialization
add a1, x0, x5 ;
add a0, x0, x6 ;
jal x1, gcd ;call gcd

addi x5,x0,s2
ecall x0,x5,4
ecall x1,x10,0
ebreak x0, x0, 0

gcd: 
bne x0, a0, recu ;if(0<a0) recursion
addi a0, x0, 1 ;if(a0<=0)return 1
jalr x0, 0(x1) ;return

recu: 
sd x1, -8(sp) ;push ra
addi sp, sp, -8 ;adjust sp
rem a0, a0, a1 ;gcd(a0,a1)
addi a0, a0, -1 ;a0=a0-1
jal x1, gcd ;recursive call
addi sp, sp, 8 ;adjust sp
ld x1, -8(sp) ;pop ra
jalr x0, 0(x1) ;return