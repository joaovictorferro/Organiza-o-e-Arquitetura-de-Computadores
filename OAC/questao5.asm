#considerei que o registrador $s1, esta com os numero entao eu carreguei eles
lw $a1, 0($s1) 			# carrega o numero A
lw $a2, 4($s1) 			# carrega o numero B

jal Mult
j Exit

Mult:
	addi $sp, $sp, -8 		# ajustando pilha p/ 2 itens
	sw $ra, 4($sp) 			# salva endereço de retorno
	sw $a2, 0($sp) 			# salva argumento
	slti $t0, $a2, 1 		# testa n < 1
	beq $t0, $zero, L1
	addi $sp, $sp, 8 		# pop 2 itens da pilha
	jr $ra 				# e retorna

L1: 
	addi $a2, $a2, -1 		# senão decrementa n
	jal Mult 			# chamada recursiva
	lw $a2, 0($sp) 			# restaura n original
	lw $ra, 4($sp) 			# e endereço de retorno
	addi $sp, $sp, 8 		# pop 2 itens da pilha
	add $v1, $a1, $v1 		# multiplica p/ obter resultado
	jr $ra

Exit: 		