addi $s0,$zero,-3 # declarando a variavel A
addi $s1,$zero,-1 # declarando a variavel B

beq $s0,$s1,L1
slt $t0,$s1,$s0
bne $t0,$zero,Exit

L1: 
	add $s2,$s2,$s0
	addi $s0,$s0,1
	slt $t0,$s1,$s0
	beq $t0,$zero,L1
	addi $v1,$zero,1
	bne $v1,$zero,Exit

Exit: