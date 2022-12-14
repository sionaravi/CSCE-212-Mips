# Siona Ravi
# CSCE 212
# Project 3
# Program 1

.data

message: .asciiz "Please enter 3 integers: "
message1: .asciiz "The maximum integer: "

.text

main:

	li $v0, 4
	la $a0, message
	syscall


	li $v0, 5
	syscall
	move $s1, $v0


	li $v0, 5
	syscall
	move $s2, $v0


	li $v0, 5
	syscall
	move $s3, $v0

	li $v0, 4
	la $a0, message1
	syscall


	bgt $s1, $s2, scanAC
	j scanBC


scanAC: bgt $s1, $s3, outputA
	j outputC

scanBC: bgt $s2, $s3, outputB
	j outputC

outputA:
	li $v0, 1
	move $a0, $s1
	syscall
  
	j exit
  
outputB:
	li $v0, 1
	move $a0, $s2
	syscall
  
j exit

outputC:
	li $v0, 1
	move $a0, $s3
	syscall
  
	j exit
  
exit:
	li $v0, 10
	syscall

