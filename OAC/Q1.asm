#declarei as variaveis
addi $a1,$zero,2
addi $a2,$zero,1
addi $a3,$zero,0

#fiz com que m recebece a
add $a3,$zero,$a1

#verifico o if
slt $t0,$a2,$a3 # se b < m
beq  $zero,$t0,Else # se for zero continua, se nao vai para label (Else)
add $a3,$zero,$a2 #B recebe M
j Exit
Else: add $a3,$zero,$zero

Exit:
