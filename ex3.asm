#3. Crie um programa que lê o mês e o ano de nascimento de uma pessoa e o mês e ano atual.
#Calcule e mostre qual é: a idade da pessoa em meses.
.data
	mesnascimento: .asciiz "Digite O Mes De Nascimento: "
	anonascimento: .asciiz "Digite O ano Do Nascimento: "
	mesatual: .asciiz "Digite O Mes Atual: "
	anoatual: .asciiz "Digite O Ano Atual: "
	total: .asciiz "O Total Em Meses é: "
	#considerando ano = 364 dias e mes = 30 dias
	
.text
main:
	li $v0,4
	la $a0,mesnascimento
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,4
	la $a0,anonascimento
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,mesatual
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	
	li $v0,4
	la $a0,anoatual
	syscall
	
	li $v0,5
	syscall
	move $t3,$v0
	
	#Processo:
	li $t4,30
	li $t5,364
	li $t6,12
	
	
	mul $t0,$t0,$t4 #Calcular Dias Em Meses do Nascimento
	mul $t1,$t1,$t4 #Anos Em Dias Do Nascimento
	add $t0,$t0,$t1 #Calcular Meses E Anos Totais Em Dias Juntos:
	
	mul $t2,$t2,$t4
	mul $t3,$t3,$t4	
	add $t2,$t2,$t3 #Mesmos Processos,porém com o ano e mes atual
	
	sub $t0,$t0,$t1 #Dias Passados Até Então
	
	div $t0,$t6
	mflo $t1 #Pegar Resultado Da Conta
	
	li $v0,4
	la $a0,total
	syscall
	
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,10
	syscall
	