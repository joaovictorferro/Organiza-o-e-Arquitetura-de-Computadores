#declarei as variaveis
addi $a0,$zero,2
addi $a1,$zero,1
addi $a2,$zero,0

#fiz com que m recebece a
add $a2,$zero,$a0

#verifico o if
slt $t0,$a1,$a2
