#6.Escreva um programa que pergunte dois números e indique se são iguais ou diferentes. Caso
#sejam diferentes, mostre o maior e o menor (nesta ordem).
.data
	n1: .asciiz " Digite Um Número: "
	n2: .asciiz "Digite Outro Número: "
	iguais: .asciiz "Os Números Digitados São Iguais! "
	diferentes: .asciiz "Os Números Digitados São Diferentes! n1 > n2 "
	diferentes2: .asciiz "Os Números Digitados São Diferentes! n1 < n2 "
	linha: .asciiz "\n"
	igual: .asciiz " = "
	maior: .asciiz " > "
	menor: .asciiz " < "
.text
main:
	#n1 Texto
	li $v0,4
	la $a0,n1
	syscall
	
	#n1 valor
	li $v0,5
	syscall
	move $t0,$v0
	
	#n2 Texto:
	li $v0,4
	la $a0,n2
	syscall 
	
	 #n2 valor:
	 li $v0,5
	 syscall
	 move $t1,$v0
	 
	 #Processos:
	 beq $t0,$t1,fim1
	 bgt $t0,$t1,fim2
	 bgt $t1,$t0,fim3
	 
	 fim1:
	 li $v0,4
	 la $a0,iguais
	 syscall
	 
	 li $v0,4
	 la $a0,linha
	 syscall
	 
	 li $v0,1
	 move $a0,$t0
	 syscall
	 
	 li $v0,4
	 la $a0,igual
	 syscall
	 
	 li $v0,1
	 move $a0,$t1
	 syscall
	 
	 j fim_programa
	 
	 fim2:
	 li $v0,4
	 la $a0,diferentes
	 syscall
	 
	 li $v0,4
	 la $a0,linha
	 syscall
	 
	 li $v0,1
	 move $a0,$t0
	 syscall
	 
	 li $v0,4
	 la $a0,maior
	 syscall
	 
	 li $v0,1
	 move $a0,$t1
	 syscall
	 j fim_programa
	 
	 fim3:
	 li $v0,4
	 la $a0,diferentes2
	 syscall
	 
	 li $v0,4
	 la $a0,linha
	 syscall
	 
	 li $v0,1
	 move $a0,$t0
	 syscall
	 
	 li $v0,4
	 la $a0,menor
	 syscall
	 
	 li $v0,1
	 move $a0,$t1
	 syscall
	 
	 fim_programa:
	 li $v0,10
	 syscall
	 
	 
	 
	 
	 
	  