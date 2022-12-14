# Siona Ravi
# CSCE 212
# Project 2
# Program 3

.data

# a is in $s0, b is in $s1 and f is in $s2
intro: .asciiz "Hello we are using if else statement here"
prompt1: .asciiz "\nEnter the value for a: "
prompt2: .asciiz "Enter the value for b: "



.text
	# prints intro
	li $v0, 4
	la $a0, intro
	syscall
	
	# asks the user input for a
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	# asks the user input for b
	li $v0,4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	
if: 	bge $s0, 5, else
	blt $s1, 5, else
	sub $s2, $s0, $s1
		j exit
else:  	mul $s2, $s0, $s1

exit:
        addi $v0, $0, 10
        syscall

	
	
	
	
	
	