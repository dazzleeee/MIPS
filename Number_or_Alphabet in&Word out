.data 
    Upper_Alphabet_Word:  .asciiz    "Alpha\n","Bravo\n","China\n","Delta\n","Echo\n","Foxtrot\n","Golf\n","Hotel\n",
    "India\n","Juliet\n","Kilo\n","Lima\n","Mary\n","November\n","Oscar\n","Paper\n","Quebec\n",
    "Research\n","Sierra\n","Tango\n","Uniform\n","Victor\n","Whisky\n","X-ray\n","Yankee\n","Zulu\n"
    Lower_Alphabet_Word: .asciiz    "alpha\n","bravo\n","china\n","delta\n","echo\n","foxtrot\n","golf\n","hotel\n","india\n",
    "juliet\n","kilo\n","lima\n","mary\n","november\n","oscar\n","paper\n","quebec\n","research\n",
    "sierra\n","tango\n","uniform\n","victor\n","whisky\n","x-ray\n","yankee\n","zulu\n"
    Number:		.asciiz "zero\n", "one\n", "two\n", "three\n", "four\n", "five\n", "six\n", "seven\n","eight\n","nine\n"
    Offset_Alphabet: .word	0,7,14,21,28,34,43,49,56,63,71,77,83,89,99,106,113,121,131,139,146,155,163,171,178,186
    Offset_Number: .word 	0,6,11,16,23,29,35,40,47,54
    Exit_String: .asciiz "\nYour Program is Stopped!\n"
.text 
main:
    # judge ?
    li $v0,12
    syscall
    beq $v0,'?',exit
    
    # judge symbol before zero
    sub $t1,$v0,'0'
    blt $t1,0,star
    
    # judge number
    sub $t2,$t1,10
    blt $t2,0,getNumber
    
    # judge symbol between nine & A
    sub $t3,$v0,'A'
    blt $t3,0,star
    
    # judge Capital
    sub $t4,$v0,91
    blt $t4,$0,getUpper
    
    # judge symbol between Z & a
    sub $t5,$v0,'a'
    blt $t5,0,star

    # judge Lower
    sub $t6,$v0,123
    blt $t6,$0,getLower
    
    # judge symbol after z
    bgt $t6,0,star
    
    

 
star:
	add $a0,$0,'*'
	li $v0,11
  	syscall
  	j main
  
getNumber:
	la $s0,Offset_Number
	la $a0,Number
	add $t2,$t2,10
	sll $t2,$t2,2
	add $s0,$s0,$t2
	lw $s1,($s0)	
	add $a0,$a0,$s1
	li $v0,4
	syscall
	j main
	
getUpper:
	la $s0,Offset_Alphabet
	la $a0,Upper_Alphabet_Word
	add $t4,$t4,26
	sll $t4,$t4,2
	add $s0,$s0,$t4
	lw $s1,($s0)	
	add $a0,$a0,$s1
	li $v0,4
	syscall
	j main    
	
getLower:
	la $s0,Offset_Alphabet
	la $a0,Lower_Alphabet_Word
	add $t6,$t6,26
	sll $t6,$t6,2
	add $s0,$s0,$t6
	lw $s1,($s0)	
	add $a0,$a0,$s1
	li $v0,4
	syscall
	j main  
exit:	
  	la $a0,Exit_String
   	li $v0,4
	syscall
   
    
