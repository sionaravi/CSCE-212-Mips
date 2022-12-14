# Siona Ravi
# CSCE 212
# Project 2
# Program 1

.data 
	intro: .asciiz "Hello we are solving  f = a * i + b"
	prompt1: .asciiz "\nEnter the value for a: "
	prompt2: .asciiz "Enter the value for b: "
	i: "i"
	a: "a"
	b: "b"
	f: "f"
	tab: "  "
	newLine: "\n"
	
.text

   main:
	# prints out intro
	li $v0, 4
	la $a0, intro
	syscall
	
	# asks the user input for a
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# asks the user input for b
	li $v0,4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	# print i
	li $v0, 4
	la $a0, i
	syscall 
        
        # prints tab
	li $v0, 4
	la $a0, tab
	syscall 
        
        # print a
	li $v0, 4
	la $a0, a
	syscall 
        
        # prints tab
	li $v0, 4
	la $a0, tab
	syscall
        
        # print b
	li $v0, 4
	la $a0, b
	syscall 
        
        # prints tab
	li $v0, 4
	la $a0, tab
	syscall
        
        # print f
	li $v0, 4
	la $a0, f
	syscall 
        
         # prints newline
	li $v0, 4
	la $a0, newLine
	syscall
        
        #index for loop
        addi $t2, $0, 0
        addi $s0, $0, 5  
	
	for:    
	
	beq $t2, $s0, endOfLoop      
        mul $t3, $t2, $t0    	       
        add $t3, $t3, $t1            # a * i + b
        
        # value of i prints
        addi $v0, $0, 1
        addi $a0, $t2, 0
        syscall 
        
        # prints tab
	li $v0, 4
	la $a0, tab
	syscall 
        
        # value of a prints
        addi $v0, $0, 1
        addi $a0, $t0, 0
        syscall
        
        # prints tab
	li $v0, 4
	la $a0, tab
	syscall
        
        # value of b prints
        addi $v0, $0, 1
        addi $a0, $t1, 0
        syscall
        
        # prints tab
	li $v0, 4
	la $a0, tab
	syscall 
        
        # value of f prints
        addi $v0, $0, 1
        addi $a0, $t3, 0
        syscall 
        
        
        # prints newline
	li $v0, 4
	la $a0, newLine
	syscall 
        
        
        addi $t2, $t2, 1
        j for
        
endOfLoop:
        addi $v0, $0, 10
        syscall
	
	
	
	    	
		

	
	
	 
