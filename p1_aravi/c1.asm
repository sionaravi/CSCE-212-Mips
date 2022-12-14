# Siona Ravi
# CSCE 212
# Project 1
# Program 1


 .data
	ask_name:   	  .asciiz "Hello, may I have your name, please?\n"
	greetings:        .asciiz "Hello, "
	name:             .space  20	

.text
	main:
	
	# asks name here
	li $v0, 4
	la $a0, ask_name
	syscall

	# gets the name
	li $v0, 8
	la $a0, name
	li $a1, 40
	syscall

	# prints the greetings
	li $v0, 4
	la $a0, greetings
	syscall

	# includes name
	li $v0, 4
	la $a0, name
	syscall

        # this is end of main
	li $v0, 10
	syscall
	

	
	
