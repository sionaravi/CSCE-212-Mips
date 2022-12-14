# Siona Ravi
# CSCE 212
# Project 5
# Program 2


.data

prompt: .asciiz "Enter n:  "  
sol: .asciiz "3^(n+1) = " 
error: .asciiz "Please enter the right value for n"
 

.text
main:
 
input:
       li $v0,4          
       la $a0,prompt    
       syscall


       li $v0,5         
       syscall           
       move $a0,$v0    
       bge $a0,0,callsubroutine 

       li $v0,4         
       la $a0,error      
       syscall
       b prompt          

       
       
callsubroutine:

       jal three_to     
       move $a0,$v0     

       jal three_toplus  
       move $v1,$v0      



       li $v0,4            
       la $a0,sol      
       syscall


       li $v0,1           
       move $a0,$v1       
       syscall           
      
       li $v0, 10            
       syscall



three_to:                       
        li $v0,1            
        li $s0,1            
        li $s1,3            
loop:
        bgt $s0,$a0,exit     

        mul $v0,$v0,$s1     
        addi $s0,$s0,1          
        b loop               
exit:        
        jr $ra                     



three_toplus:                


        li $s1,3              
        mul $v0,$a0,$s1      
        jr $ra   
        
                   
                             
