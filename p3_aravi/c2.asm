# Siona Ravi
# CSCE 212
# Project 3
# Program 2

.data
	n:.asciiz "Name: "
	w:.asciiz "Weight (whole pounds): "
	h:.asciiz "Height (whole inches): "
	bequation:.asciiz " Calculated BMI: "

	name: 	.space 20
	weight: .word
	height: .word
	bmi:	.float

	bmivalue: .float 18.5, 24.9, 40
	bmistat: .asciiz "\nThis is considered "
	bmicalc: .asciiz "underweight.   ", "normal weight. ", "overweight.    "

.text

main:
	li $v0 33
	li $a0 52
	li $a1 20
	li $a2 22
	li $a3 127
	syscall
	
	# Get name
	la $a0 n
	li $v0 4
	syscall
	#Load input into name
	li $v0 8
	la $a0 name
	syscall
	
	# Remove newline from input
	li $t0 -1
index:	addi $t0 $t0 1
	lb $t1 name($t0)
	bne $t1 0xA index
	sb $zero name($t0)
	
	# Weight
	la $a0 w
	li $v0 4
	syscall
	# Get weight into $s0
	li $v0 5
	syscall
	move $s0 $v0
	
	# Height 
	la $a0 h
	li $v0 4
	syscall
	# Get height into $s1
	li $v0 5
	syscall
	move $s1 $v0
	
	# BMI Calculations
	mul $s0 $s0 703
	mul $s1 $s1 $s1
	
	mtc1 $s0 $f20
	cvt.s.w $f20 $f20
	mtc1 $s1 $f21
	cvt.s.w $f21 $f21
	div.s $f12 $f20 $f21
	
	# Output BMI
	la $a0 name
	li $v0 4
	syscall
	la $a0 bequation
	syscall
	li $v0 2
	syscall
	
	# Determine weight class
	li $t0 -4
	la $t1 bmivalue
status: addi $t0 $t0 4
	add $t2 $t1 $t0
	l.s $f22 ($t2)
	c.le.s $f12 $f22
	bc1f status
	
	# Assesment for weight
	li $v0 4
	la $a0 bmistat
	syscall
	
	
	la $t1 bmicalc
	sll $t0 $t0 2
	add $t2 $t1 $t0
	la $a0 ($t2)
	syscall
	
exit:
li $v0, 10
syscall
