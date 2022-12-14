# Siona Ravi
# CSCE 212
# Project 4
# Program 3

.data
array : .space 1000
msg2: .asciiz "Enter element "
msg3: .asciiz " : "
msg4: .asciiz "Sum of array values is : "
msg6: .asciiz "Enter size of the array : "
size : .word 10
.text
main :
li   $v0, 4
la   $a0, msg6
syscall
li $v0, 5
syscall
sw $v0,size 


la $a0,array 
lw $a1,size 
jal fillArray 

la $a0,array 
lw $a1,size 
jal addElement 
li   $v0, 4
la   $a0, msg4
syscall
li $v0,1
move $a0,$t7
syscall


li $v0,10 
syscall



fillArray :
subu $sp,$sp,4 
sw $a0,($sp)
subu $sp,$sp,4 
sw $a1,($sp) 
subu $sp,$sp,4 
sw $s0,($sp) 
subu $sp,$sp,4
sw $s1,($sp)
subu $sp,$sp,4 
sw $s2,($sp)
subu $sp,$sp,4 
sw $t0,($sp) 
subu $sp,$sp,4 
sw $ra,($sp) 


move $s0,$a1
move $t0,$a0 #get address
li $s1,0 #index for loop
read_values_loop:
bge $s1,$s0,read_values_loop_exit

#show enter value message
li   $v0, 4
la   $a0, msg2
syscall

addi $s2,$s1,1
move $a0,$s2
li $v0,1
syscall

li   $v0, 4
la   $a0, msg3
syscall


li $v0, 5
syscall

mul $s2,$s1,4
add $s2,$s2,$t0 #load address of array element
sw $v0,0($s2) #save value to array

addi $s1,$s1,1
j read_values_loop
read_values_loop_exit:

lw $ra,($sp)
addu $sp,$sp,4 
lw $t0,($sp) 
addu $sp,$sp,4 
lw $s2,($sp)
addu $sp,$sp,4 
lw $s1,($sp)
addu $sp,$sp,4 
lw $s0,($sp) 
addu $sp,$sp,4 
lw $a1,($sp) 
addu $sp,$sp,4 
lw $a0,($sp) 
addu $sp,$sp,4 

jr $ra

addElement:
subu $sp,$sp,4 
sw $a0,($sp) 
subu $sp,$sp,4 
sw $a1,($sp) 
subu $sp,$sp,4 
sw $s0,($sp) 
subu $sp,$sp,4 
sw $s1,($sp) 
subu $sp,$sp,4 
sw $s2,($sp) 
subu $sp,$sp,4 
sw $t0,($sp) 
subu $sp,$sp,4 
sw $ra,($sp) 


move $t0,$a0
move $s0,$a1
li $s1,0 
li $t7,0 
add_loop:
bge $s1,$s0,addLoopExit

mul $s2,$s1,4
add $s2,$s2,$t0 
lw $v0,0($s2) 

add $t7,$t7,$v0 
addi $s1,$s1,1
j add_loop

addLoopExit:
lw $ra,($sp) 
addu $sp,$sp,4 
lw $t0,($sp) 
addu $sp,$sp,4 
lw $s2,($sp)
addu $sp,$sp,4 
lw $s1,($sp) 
addu $sp,$sp,4 
lw $s0,($sp) 
addu $sp,$sp,4 
lw $a1,($sp) 
addu $sp,$sp,4 
lw $a0,($sp)
addu $sp,$sp,4 
jr $ra