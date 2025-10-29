.data
	n: .asciiz "Digite O Valor De N: "
	centena: .asciiz "O Valor Total Em Centena é: "
	dezena: .asciiz "O Valor Total Em Dezena é: "
	unidade: .asciiz "O Valor Em Unidade é: "
	linha: .asciiz "\n"
	denovo: .asciiz "Valor Inválido, Tente Novamente!: "
	
.text
main:
	#Mensagem N :
	li $v0,4
	la $a0,n
	syscall
	
	#Valor N: 
	li $v0,5
	syscall
	move $t0,$v0
	
	li $t1,100
	li $t2,10
	li $t3,1
	li $t4,0 #Acumulador Centena
	li $t5,0 #Acumulador Dezena
	li $t6,0 #Acumulador Unidade
	li $t7,1 #Acrescentar 1
	li $t8,999
	j validar_n
	
	validar_n:
	blt $t0,$t1,pedir_denovo
	bgt $t0,$t8,pedir_denovo
	j loop_verificar
	
	pedir_denovo:
	li $v0,4
	la $a0,denovo
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	j validar_n
	
	loop_verificar:
	bge $t0,$t1,diminuir_centena #Se For Maior Que 100, Faça isso:
	bge $t0,$t2,diminuir_dezena #Se Maior, Vá Para Diminuir Dezena:
	bge $t0,$t3,diminuir_unidade #Se Maior que 1,va para diminuir unidade
	j fim
	
	diminuir_centena:
	sub $t0,$t0,$t1
	add $t4,$t4,$t7
	j loop_verificar
	
	diminuir_dezena:
	sub $t0,$t0,$t2
	add $t5,$t5,$t7
	j loop_verificar
	
	diminuir_unidade:
	sub $t0,$t0,$t3
	add $t6,$t6,$t7
	j loop_verificar
	
	fim:
	li $v0,4
	la $a0,centena
	syscall
	
	li $v0,1
	move $a0,$t4
	syscall
	
	li $v0,4
	la $a0,linha
	syscall
	
	li $v0,4
	la $a0,dezena
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	
	li $v0,4
	la $a0,linha
	syscall
	
	li $v0,4
	la $a0,unidade
	syscall
	
	li $v0,1
	move $a0,$t6
	syscall
	
	li $v0,4
	la $a0,linha
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	
	
