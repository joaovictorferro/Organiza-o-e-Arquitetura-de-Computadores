.data
ENTRADA: .asciiz "casa"
.text
main:
    
    la $a0, ENTRADA
    jal strlen 
    j reversa
strlen:
    addi $t0, $zero, 0 #zerando o contador, $t0 guarda o tamanho da string;
        loop: 
            lb $t1, 0($a0) # carrega o proximo byte dentro de t2;
            beqz $t1, fimloop # se $t2 for 0 (fim da string) pula pra saida;
            addi $a0, $a0, 1 # incrementa o pointeiro da string;
            addi $t0, $t0, 1 # incrementa o contador;
            j loop 
        fimloop:
            add $a1, $t0, $zero #transfere para $a1 o tamanho da string ($t0)
            jr $ra 
reversa:
    add $t0,$a0,$zero #endereço de inicio
    
    add $t1,$zero,$zero  #inicializa $t1 como contador: i = 0
    addi $t2,$a1,-1   #inicia $t1 como contador: j = tamanho - 1  
         
    loop2: #do { } while;
    
        #carregando byte em $t4 para o indice i
        add $t3, $t0, $t1 
        lb $t4, 0($t3)
        
        #carregando byte em $t6 para o indice j 
        add $t5, $t0, $t2 
        lb $t6, 0($t5)
        
        #revertendo os caracteres
        sb $t4,0($t5) #String[j]=String
        sb $t6,0($t3) #String=String[j]
         
         #incrementando i e j
         addi $t1,$t1,1 #i++
        addi $t2,$t2,-1 #j--
        
        #teste para repetir o loop
                        
        slt $t6,$t2,$t1  
        beqz $t6,loop2 #testa se j >= i, caso seja, o loop se reinicia 
FIM: