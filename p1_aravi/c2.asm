# Siona Ravi
# CSCE 212
# Project 1
# Program 2

.data

   prompt1 : .asciiz "Enter int a =  " 
   prompt2 : .asciiz "Enter int b =  " 
   prompt3 : .asciiz "Enter int c =  " 
   prompt4 : .asciiz "Enter int d =  " 
   solution: .asciiz " F = "
     	
.text
		main:
		
		# prints int a
		la $a0, prompt1
	        li $v0, 4
  		syscall

		
		li $v0, 5
		syscall
		move $s0, $v0

		# prints int c 
		la $a0, prompt2
	        li $v0, 4
  		syscall
  		
  		
  		li $v0, 5
		syscall
		move $s1, $v0
		
		# print int d
		la $a0, prompt3
	        li $v0, 4
  		syscall
		
		
		li $v0, 5
		syscall
		move $s2, $v0

		la $a0, prompt4
	        li $v0, 4
  		syscall

		
		li $v0, 5
		syscall
		move $s3, $v0
		
		# calculates the equation F = (a+b)-(c+d)+(b+3)
		add $t0, $s0, $s1 # a+b
		add $t1, $s2, $s3 # c+d
		addi $t2 ,$s1, 3  # b+3
		sub $t3, $t0, $t1 # (a+b)-(c+d)
		add $t4, $t3, $t2 # (a+b)-(c+d) + (b+3)
		
		
	        # prints solution for F
		li $v0, 4
		la $a0, solution
		syscall

		li $v0, 1
		move $a0, $t4
		syscall


		# this is end of main
		li $v0, 10
		syscall    	
		
