#8.Escreva um algoritmo que leia (em números inteiros) o valor da compra de um produto da Loja
#Vende Tudo. A loja só vende produtos de valor entre R$1000.00 e R$9999.99 (Que deve ser
#validado na entrada). A loja permite pagar o valor em parcelas fixas. O algoritmo deve ler
#também o valor da parcela a ser paga, que deve ser um valor entre R$100.00 e R$500.00 (Que
#deve ser validado na entrada). O algoritmo, sabendo que a última parcela pode ser de valor
#inferior às anteriores, deve calcular quantas parcelas serão pagas.
.data
	compratotal: .asciiz "Digite O Valor Da Compra! "
	ninvalido: .asciiz "Resultado Inválido, por favor tente novamente! "
	parcelas: .asciiz "Digite A Quantidade De Parcelas a serem pagas por mês: "
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
	li $t1,1000
	li $t2,10000
	li $t3,100
	li $t4,500
	#t5 já está sendo usado
	li $t6,0
	li $t7,1
	
	verificar_n:
	blt $t0,$t1,n_invalido
	bgt $t0,$t2,n_invalido
	j processo
	
	n_invalido:
	li $v0,4
	la $a0,ninvalido
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	j verificar_n
	
	processo:
	li $v0,4
	la $a0,parcelas
	syscall
	
	li $v0,5
	syscall
	move $t5,$v0
	
	verificar_parcelas:
	blt $t5,$t3,parcela_invalida #Se Menor Que 100,peça dnv
	bgt $t5,$t4,parcela_invalida #se maior que 100000,peça dnv
	j calc_parcelas
	
	parcela_invalida:
	li $v0,4
	la $a0,parcelas_invalidas
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	j verificar_parcelas
	
	calc_parcelas:
	bgt $t0,$t1,diminuir_conta 
	j veredito_final
	
	diminuir_conta:
	sub $t0,$t0,$t1
	add $t6,$t6,$t7
	j calc_parcelas
	
	veredito_final:
	div $t0,$t1
	mfhi $t8
	
	bne $t8,$zero,adc_acumulador
	j fim1
	
	adc_acumulador:
	add $t6,$t6,$t7
	j fim2
	
	fim1:
	li $v0,4
	la $a0,total
	syscall
	
	li $v0,1
	move $a0,$t7
	syscall
	
	li $v0,10
	syscall
	
	fim2:
	li $v0,4
	la $a0,total
	syscall
	
	li $v0,1
	move $a0,$t7
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	
	
	
	
	