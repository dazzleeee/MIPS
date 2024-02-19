.data 
	buffer:	 .space 50
	success: .asciiz "Success! Location:"
	fail:	 .asciiz "Fail!\n"
	inputString_notice: .asciiz"Please input String\n" 
	inputChar_notice: .asciiz"Please input a Char\n" 
.text 

main:
	#notice about input string
	li $v0,4
	la $a0,inputString_notice
	syscall
	#read string
	la $a0,buffer # creat buffer of 50 size
	li $a1, 50
	li $v0,8# get string	
	syscall 
	#notice about input string
	li $v0,4
	la $a0,inputChar_notice
	syscall
	#print character	
	li $v0, 12
	syscall
	#judge ?
	sub $t0, $v0, 63
	beq $t0, $0,end	#t1 save the value of character
	la $t1, buffer   #t0 is the first address of String
	li $t2, 1   #t2 is a counter
find:
	lb $t3, ($t1)	# Put the value of the first component of string into t3
	beq $t3, 0, fail_to_find #0 means that the string have been searched entirely
	beq $t3, $v0, succeed_to_find #if the input(v0) equal t3(the char in string),which means succeed
	add $t1, $t1, 1#if the char hasn't been find,and the string hasn't been searched entirely,then to seach the next one char
	add $t2, $t2, 1#plus the counter
	j find
succeed_to_find:
	li $v0, 4
	la $a0, success
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	j main
fail_to_find :
	li $v0, 4
	la $a0, fail
	syscall
	j main
end:
	li $v0,10
	syscall
	  
	

