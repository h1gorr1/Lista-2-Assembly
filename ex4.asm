#4.O propriet�rio da empresa ABC LTDA precisa de um programa de computador para calcular o
#novo sal�rio que seus funcion�rios ir�o receber a partir do m�s que vem. Sabendo que o
#aumento de sal�rio para todos os funcion�rios ser� de 25%, fa�a um programa que l� o valor do
#sal�rio atual do funcion�rio e informa o seu novo sal�rio acrescido de 25% (Por se tratar de
#apenas n�mero inteiros, para calcular 25% deve-se multiplicar o valor por 25 e dividir por 100).
.data
	atual: .asciiz "Digite O S�lario Atual: "
	total: .asciiz "O Valor Total Atual �: "
.text
main:
	# Texto Atual
	li $v0,4
	la $a0,atual
	syscall
	
	# Valor atual
	li $v0,5
	syscall
	move $t0,$v0
	
	#Processo
	li $t1,25
	li $t2,100
	li $t3,1
	
	mul $t3,$t3,$t0
	mul $t0,$t0,$t1
	div $t0,$t2
	mflo $t0
	add $t0,$t0,$t3
	
	li $v0,4
	la $a0,total
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	
	li $v0,10
	syscall
	
	
	