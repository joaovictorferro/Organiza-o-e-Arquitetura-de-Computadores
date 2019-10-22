#obs: admiti que o registrador $a1 esta com a tring armazenada
    jal strlen 
    j reversa
    
strlen:
    addi $t0, $zero, 0 #zerando o contador, $t0 guarda o tamanho da string;
        loop: 
            lb $t1, 0($a1) # carrega o proximo byte dentro de t1;
            beqz $t1, fimloop # se $t1 for 0 (fim da string) pula pra saida;
            addi $a1, $a1, 1 # incrementa o pointeiro da string;
            addi $t0, $t0, 1 # incrementa o contador;
            j loop 
        fimloop:
            add $a2, $t0, $zero #transfere para $a2 o tamanho da string ($t0)
            jr $ra 
reversa:
    add $t0,$a1,$zero #endereço de inicio
    
    add $t1,$zero,$zero  #inicializa $t1 como contador: i = 0
    addi $t2,$a2,-1   #inicia $t1 como contador: j = tamanho - 1  
         
    L2:    
        #carregando byte em $t4 para o indice i
        add $t3, $t0, $t1 
        lb $t4, 0($t3)
        
        #carregando byte em $t6 para o indice j 
        add $t5, $t0, $t2 
        lb $t6, 0($t5)
        
        sge $t7, $t4, 97 # PELA TABELA ASCII
	sle $t8, $a2, 122 # OS MINUSCULOS
	and $t9, $t7, $t8 # ESTAO ENTRE [97;122]# T9 = LETRA MINUSCULA
	beq $t9, 1, minusculo #CONVERTE!
	sle $t8, $a2, 90 # OS MAIUSCULOS
	and $t9, $t7, $t8 # ESTAO ENTRE [65;90]# T9 = LETRA MAISCULA
	beq $t9, 1, maisculo #CONVERTE!
	beq $t9, 0, ERROR # SE NAO E MAIUSCULO NEM MINUSCULO, NAO E LETRA!

        #revertendo os caracteres
        sb $t4,0($t5) #String[j]=String
        sb $t6,0($t3) #String=String[j]

L3:     
	#incrementando i e j
        addi $t1,$t1,1 #i++
        addi $t2,$t2,-1 #j--
        slt $t6,$t2,$t1  
        beqz $t6,L2 #testa se j >= i, caso seja, o loop se reinicia 
        j FIM
        
maisculo:
	add $t4, $t4, 32 # CONVERSAO MAIUSCULO MINUSCULO
	j L3 # RETORNA

minusculo:
	sub $t4, $t4, 32 # CONVERSAO MAIUSCULO MINUSCULO
	j L3 # RETORNA

ERROR:
	# Caso a string possua algum caractere que não seja letra o
	# valor 1 sera armazenado no registrador v1
	move $v1, $zero #ZERA V1
	addi $v1,$v1,1

FIM:
