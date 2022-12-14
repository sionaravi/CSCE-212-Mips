# Siona Ravi
# CSCE 212
# Project 4
# Program 1


.data

   a: .asciiz  "A: "
   b: .asciiz "B: "
   c: .asciiz "C: "
   q : .asciiz "Q = "
   prompt1: .asciiz "Overflow"
   prompt2: .asciiz "No overflow"
   prompt3: .asciiz "Division by zero"
   
   
.text
main:

	
	li $v0, 4
	la $a0, a
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, b
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, c
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	beq $v1, 0, end
	jal Looping3
	jal Ending1
	jal Ending2
	li $v0, 1
	move $a0, $v1
	syscall
	li $v0, 10
	syscall
	
Looping1: 

	addi $s0, $s0, 1
	bgtu $s0, $t2, exit
	mul $t4, $t1, $t1
	add $s0, $s0, 1
	
end: 
	add $t3, $t0, $t4
	jr $ra
	
Looping2:

	mul $t0, $t0, $t0
	sub $t2, $t2, $t0
	seq $v1, $t2, $zero
	jr $ra
	
Looping3: 
	
	divu $t5, $t3, $t2
	jr $ra

Ending1: 
	addi $t6, $t6, 3
	mul $s1, $t6, $t1
	jr $ra
	
Ending2: 
	add $v1, $s1, $t5
	jr $ra
	
exit: 
	li $v0, 10
	syscall
	