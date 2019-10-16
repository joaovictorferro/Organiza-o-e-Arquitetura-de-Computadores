addi $s0,$zero,0 #inicializar a variavel a
addi $s1,$zero,0 #inicializar a variavel b

sgt $t0,$zero,$s0 #se zero for maior que a
bne $t0,$zero,Elseif #caso zero seja maior que a entra na label Elseif
slt $t1,$s0,$s1 #a menor que b
beq $t1,$zero,Elseif # caso a seja maior que b, entao entra na label Elseif
addi $s2,$zero,1 #variavel x recebe 1
j Exit #acabou

Elseif:
	slt $t0,$s0,$zero #a e menor que zero
	beq $t0,$zero,Else # caso a seja maior que zero entao entra na label Else
	sgt $t1,$s0,$s1 #a maior que b
	beq $t0,$zero,Else # se a menor que b entra na label Else
	addi $s2,$zero,2 #variavel x recebe 2
	j Exit #acabou
	
Else:
	addi $s2,$zero,3 #variavel x recebe 3

Exit: 

#mostra o resultado
li $v0,1
move $a0,$s2
syscall
