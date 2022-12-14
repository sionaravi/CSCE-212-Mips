# Siona Ravi
# CSCE 212
# Project 5
# Program 1

.data

num1: .asciiz "Enter number 1: "
num2: .asciiz "Enter number 2: "



.text
.globl main

main:

	li $v0, 4
	la $a0, num1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, num2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0

	
	li $s2, 0 
	li $s3, 1 
	li $t1, 0 
	
multiply:
	beq $t1, 31, exit
	and $t0, $s1, $s3
	sll $s3, $s3, 1
	
	beq $t0, 0, multiply_inc
	add $s2, $s2, $s0
	
multiply_inc:
	sll $s0, $s0, 1
	addi $t1, $t1, 1
	j multiply
	
exit:
	li $v0, 1
	add $a0, $s2, $zero
	syscall
	
	li $v0, 10
	syscall
