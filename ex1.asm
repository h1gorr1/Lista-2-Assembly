.data
	dolar: .asciiz "Digite O Valor A Ser Convertido (US$): "
	total: .asciiz "Em R$ Fica: "
.text
main: 
	#Texto Dolar:
	li $v0,4
	la $a0,dolar
	syscall
	
	#Valor D√≥lar
	li $v0,5 #Ler Valores inteiros
	syscall #Leitor De Instru√ß√µes
	move $t0,$v0 #Mover Para t0, o que est√° para t0
	
	li $t1,5 #Valor Do Dolar
	div $t0,$t1 # Divis√£o t0 e t1 e jogar para $t3
	mflo $t3 #Pegar Resultado Da Divis„o
	
	
	li $v0,4 #FunÁ„o  Ler String
	la $a0,total #Pegar Texto Em Total
	syscall #Leitor De Instru√ß√µes
	
	li $v0,1 #FunÁ„o Ler Valor Inteiro
	move $a0,$t3
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	
	
	
	
