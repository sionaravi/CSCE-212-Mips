# Siona Ravi
# CSCE 212
# Project 2
# Program 2

.data
	string1: .asciiz "Loop starts!"
	string2: .asciiz "Loop ends!"
	array: .space 40
.text

    main:
    # array index starts from 0
    	addi $s0, $zero, 0
    	addi $t0, $zero, 0
    	
    	li $v0, 4
	la $a0, string1
	syscall
	
For:	addi $t0, $s0, 0 # i = $t0
	li $t1, 4
	sub $t2, $t1, $s0
	sll $t0, $t0, 1
	addi $s0, $s0, 2
	
	addi $t0, $t0, 1  # i++
	slti $t1, $t0, 5  # $t1 = 1 if i < 5
	bne $t1, $zero, For  #  go to For i < 5
	
	li $v0, 4
	la $a0, string2
	syscall
	

		
