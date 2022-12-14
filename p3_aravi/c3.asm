# Siona Ravi
# CSCE 212
# Project 3
# Program 3

.data
	message: .asciiz "Hello, calculate the total hours of work here!"
	hw: .asciiz "\nNo of homeworks: "
	exe: .asciiz "\nNo of exercises: "
	avgtimehw: .asciiz "Time taken for homeworks: "
	avgtimeexe: .asciiz "Time taken for exercises: "
	total: .asciiz "Total Hours worked: "
	
	
.text
 main:
	# greetings
	li $v0, 4
	la $a0, message
	syscall
	
	#ask # of hw
	li $v0, 4
    	la $a0, hw
    	syscall
    	
    	li $v0, 5
    	syscall
    	move $t0, $v0
    	
    	
    	#ask average hrs hw
	li $v0, 4
    	la $a0, avgtimehw
    	syscall
    	
    	li $v0, 5
    	syscall
    	move $t1, $v0
    	
	#ask # of exe
	li $v0, 4
    	la $a0, exe
    	syscall
    	
    	li $v0, 5
    	syscall
    	move $t2, $v0
    	
    	#ask # of hrs for exercise
	li $v0, 4
    	la $a0, avgtimeexe
    	syscall
    	
    	li $v0, 5
    	syscall 
    	move $t3, $v0
    	
   
myproc: 
	mul $t4, $t0, $t1
	mul $t5, $t2, $t3
	add $t6, $t4, $t5
	
	li $v0, 4
	la $a0, total
	syscall

	li $v0, 1
	move $a0, $t6
	syscall
	
	
exit:
	li $v0, 10
	syscall
			
    	
    	
    	
    	
	
	
	
	
	
	
	
	