#8.Escreva um algoritmo que leia (em números inteiros) o valor da compra de um produto da Loja
#Vende Tudo. A loja só vende produtos de valor entre R$1000.00 e R$9999.99 (Que deve ser
#validado na entrada). A loja permite pagar o valor em parcelas fixas. O algoritmo deve ler
#também o valor da parcela a ser paga, que deve ser um valor entre R$100.00 e R$500.00 (Que
#deve ser validado na entrada). O algoritmo, sabendo que a última parcela pode ser de valor
#inferior às anteriores, deve calcular quantas parcelas serão pagas.
.data
	compratotal: .asciiz "Digite O Valor Da Compra! "
	ninvalido: .asciiz "Resultado Inválido, por favor tente novamente! "
	parcelas: .asciiz "Digite O Valor De Parcelas a serem pagas por mês: "
	parcelas_invalidas: .asciiz "Valor Da Parcela Incorreta, por favor tente novamente!: "
	total: .asciiz "O Total Em Parcelas é: "
.text
main:
	li $v0,4
	la $a0,compratotal
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	#Processo:
	#t0 é o valor da compra
	li $t1,1000 #Valor Minimo Da Compra
	li $t2,9999 #Valor Máximo Da Compra
	li $t3,100 #Valor Mínimo Das Parcelas
	li $t4,500 #Valor Máximo Das Parcelas
	#t5 já está sendo usado,valor das parcelas
	li $t6,0 #Acumulador
	li $t7,1 #Incrementador 
	
	verificar_n:
	blt $t0,$t1,n_invalido #Se Valor Da Compra For menor que 1000,inválido
	bgt $t0,$t2,n_invalido #Se For Maior Que 9999, Inválido Tambem
	j processo #se tudo certo vá para processo
	
	n_invalido: #operação para pedir valor dnv
	li $v0,4
	la $a0,ninvalido
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	j verificar_n #passar pelo processo de verificação dnv
	
	processo: #pedir o número De Parcelas a serem pagas por mês
	li $v0,4
	la $a0,parcelas
	syscall
	
	li $v0,5
	syscall
	move $t5,$v0
	
	verificar_parcelas:
	blt $t5,$t3,parcela_invalida #Se Menor Que 100,peça dnv
	bgt $t5,$t4,parcela_invalida #se maior que 500,peça dnv Também
	j calc_parcelas #Se tudo Certo,Va Para Calc Parcelas
	
	parcela_invalida: #Novo Valor Das Parcelas
	li $v0,4
	la $a0,parcelas_invalidas
	syscall
	
	li $v0,5
	syscall
	move $t5,$v0
	j verificar_parcelas
	
	calc_parcelas:
	bge $t0,$t5,diminuir_conta 
	blt $t0,$t5,adc_acumulador
	j fim
	
	diminuir_conta:
	sub $t0,$t0,$t5
	add $t6,$t6,$t7
	
	j calc_parcelas
	
	
	adc_acumulador:
	add $t6,$t6,$t7
	j fim
	
	fim:
	li $v0,4
	la $a0,total
	syscall
	
	li $v0,1
	move $a0,$t6
	syscall
	
	li $v0,10
	syscall
