str1: DC "sampled text\0"
str2: DC " new\0"


addi a2,x0,str1+7
addi a3,x0,str2
jal x1,insch
addi x6,x0,str1
ecall x0,x6,4
ebreak x0,x0,0

insch1:
lb x5,0(a2)
sb a3,0(a2)
addi a3,x5,0
addi a2,a2,1
bne a3,a0,insch1
sb a3,0(a2)
jalr x0,0(x1)

insch:
addi x4,x1,0
ld x6,0(s0)
ld x7,0(s1)
addi s0,a2,0
addi s1,a3,0
loop3:
lb a3,0(s1)
beq a3,x0,end3
jal x1,insch1
addi s0,s0,1
addi a2,s0,0
addi s1,s1,1
beq x0,x0,loop3
end3:
addi x1,x4,0
sd x6,0(s0)
sd x7,0(s1)
jalr x0,0(x1)