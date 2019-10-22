addi $s0,$zero,-3 # declarando a variavel A
addi $s1,$zero,-1 # declarando a variavel B

beq $s0,$s1,L1 #se A ofr igual a B, entra na label L1
slt $t0,$s1,$s0 #se B e A
bne $t0,$zero,Exit # caso B seja menor que A, entre na Label Exit

L1: 
	add $s2,$s2,$s0 # faco a soma dos numeros recursivemente no intervalo
	addi $s0,$s0,1  # aumento 1 na variavel a para ir percorrendo o intervalo determinado
	slt $t0,$s1,$s0 # se B e menor que A 
	beq $t0,$zero,L1 # caso B seja maior que a chama a Label recusirvamente
	addi $v1,$zero,1 #caso A seja maior que B o registrador $v1 recebe 1 e o programa acaba

Exit:
