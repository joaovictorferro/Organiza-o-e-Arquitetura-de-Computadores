#considerei que o registrador $s1 e um array, esta com os numero entao eu carreguei eles
lw $a1,0($s1)			# carrega o numero A
lw $a2,4($s1)			# carrega o numero B

addi $t4,$zero,1	#variavel de controle da Mult
addi $t5,$zero,2	#variavel de controle da Mult

slt $t0,$a1,$zero	#verificar se e menor que zero
slt $t1,$a2,$zero	#verificar se e menor que zero
add $t3,$t0,$t1		#$t3 recebe a soma de $t1 e $t2 

beq $t3,$t4,L1		# caso o resultado for 1, chama a label L1
beq $t3,$t5,L3		# caso o resultado for 2, chama a label L3
#caso nao seja 1 nem 2, o programa segue
jal Mult
j Exit

L1:
	# A logica e que o programa funciona para a variavel B sendo positiva, entao como o resultado deu 1, significa que a variavel A ou
	# B e negativa, caso for a variavel B, trocamos a por B, caso n continuamos o programa normalmente
	beq $t1,$t4,L2	# se for 1 chama a Label L2
	jal Mult
	j Exit
	
L2:	
	add $t9 , $zero,$a1
	add $a1,$zero,$a2
	add $a2,$zero,$t9
	jal Mult
	j Exit	
	
L3:
	# precisamos deixa a variavel A e B positiva, entao utilizamos chamamos a Label cont1
	j cont1
		
L4:
	j cont2
					
cont1:
	#deixando a variavel A positiva
	addi $a1,$a1,1
	addi $t7,$t7,1
	slt $t5,$a1,$zero 
	beq $t5,$zero,L4
	j cont1

cont2:
	#deixando a variavel b positiva
	addi $a2,$a2,1
	addi $t8,$t8,1
	slt $t5,$a2,$zero 
	beq $t5,$zero,equals
	j cont2

equals:
	#com isso temos que a variavel A receber o registrador $t7, que esta com o resultado dela positivo
	#a variavel B receber o registrador $t8, que esta com o resultado dela positivo
	add $a1,$zero,$t7
	add $a2,$zero,$t8
	jal Mult
	j Exit
	
Mult:
	addi $sp, $sp, -8 		# ajustando pilha p/ 2 itens
	sw $ra, 4($sp) 			# salva endereço de retorno
	sw $a2, 0($sp) 			# salva argumento
	slti $t0, $a2, 1 		# testa n < 1
	beq $t0, $zero, L5
	addi $sp, $sp, 8 		# pop 2 itens da pilha
	jr $ra 				# e retorna

L5: 
	addi $a2, $a2, -1 		# senão decrementa n
	jal Mult 			# chamada recursiva
	lw $a2, 0($sp) 			# restaura n original
	lw $ra, 4($sp) 			# e endereço de retorno
	addi $sp, $sp, 8 		# pop 2 itens da pilha
	add $v1, $a1, $v1 		# soma para obeter o resultado
	jr $ra

Exit: 		

sw $v1,8($s1) # armazenando esse numero na memoria