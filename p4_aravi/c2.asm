# Siona Ravi
# CSCE 212
# Project 4
# Program 2

.data 

	msg: .asciiz "Instruction Count: "
	msg1: .asciiz "CPI: "
	msg2: .asciiz "Clock Rate: "
	
.text 

	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0 #a
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	 
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	jal try1
	jal try2
	jal try3
	
	li $v0, 2
	mov.s $f12, $f10
	syscall
	
	li $v0, 10
	syscall
	
try1: 
	mtc1 $t0, $f2
	mul.s $f4, $f2, $f1
	mtc1 $t1, $f3
	div.s $f6, $f4, $f3
	jr $ra
	
try2: 
	mtc1 $t2, $f7
	mul.s $f8, $f7, $f1
	mtc1 $t3, $f3
	div.s $f9, $f4, $f3
	jr $ra
	
try3: 
	c.lt.s $f6, $f9
	bc1t Upf9
	bc1f Upf6
	
Upf9: 
	div.s $f10, $f9, $f6
	jr $ra

Upf6:
 	div.s $f10, $f6, $f9
 	jr $ra

