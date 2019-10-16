addi $s0,$zero,-3
addi $s1,$zero,-1


slt $t0,$s1,$s0
bne $t0,$zero,Exit
add $s2,$zero,$s0

L1: 
	addi $s0,$s0,1
	add $s2,$s2,$s0
	slt $t0,$s1,$s0
	beq $t0,$zero,L1
	addi $v1,$zero,1
	bne $v1,$zero,Exit

Exit:

#mostra o resultado
li $v0,1
move $a0,$s2
syscall