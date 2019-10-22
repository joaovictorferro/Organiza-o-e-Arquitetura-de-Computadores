addi $a1,$zero,6
jal fib     #calcular fib (n)
j Exit

fib:
beq $a1,$zero,zero   #se a1 == 0, retorna 0
beq $a1,1,one   	# se a1 == 1 retorna one

#Calcular fib(n-1)
sub $sp,$sp,4   #armazena o endeereco de retorno da funcao, na stack
sw $ra,0($sp)
sub $a1,$a1,1   #a1 - 1
jal fib     #fib(n-1)
add $a1,$a1,1
lw $ra,0($sp)   #carrega o endereci de retorno da stack
add $sp,$sp,4
sub $sp,$sp,4   #armazenar o valor f(n-1) na stack
sw $v1,0($sp)

#Calcular fib(n-2)
sub $sp,$sp,4   #armazena o endeereco de retorno da funcao, na stack
sw $ra,0($sp)
sub $a1,$a1,2   #a1 - 2
jal fib     #fib(n-2)
add $a1,$a1,2
lw $ra,0($sp)   #restaurar o endereco na stack, para o que era antes
add $sp,$sp,4

lw $s7,0($sp)   #Pegar o valor armazenado na stack e guarda o valor no registrador $s7
add $sp,$sp,4	# restaurar a stack
add $v1,$v1,$s7 # fib(n - 2) + fib(n-1)
jr $ra 		

zero:
addi $v1,$zero,0
jr $ra

one:
addi $v1,$zero,1
jr $ra

Exit: