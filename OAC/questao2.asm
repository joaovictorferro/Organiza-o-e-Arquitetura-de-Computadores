.data
	Resultado: .asciiz "Resultado da questao: "
	Numero1: .asciiz "Digite o numero 1: "
	Numero2: .asciiz "Digite o numero 2: "
.text
	# ler os numeros 1 e 2
	li $v0,4
	la $a0,Numero1
	syscall
	
	li $v0,5
	syscall 
	
	move $t0,$v0

	li $v0,4
	la $a0,Numero2
	syscall
	
	li $v0,5
	syscall 
	
	move $t1,$v0
	
	addi $a1,$zero,0 # variavel X recebe zero
	
	beq $t0,$zero,Menor #se A == zero
	
	Menor: slt $t3,$t0,$t1 #se a < b
		bne  $t3,$zero,Else
		j Exit
		Else: addi $a1,$zero,1
		j Exit
	If2:
	
	
	
	Exit:...
	#mostra o resultado
	li $v0,4
	la $a0,Resultado
	syscall
	
	li $v0,1
	move $a0,$a1
	syscall