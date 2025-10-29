#5.Escreva um programa que pergunte os coeficientes de uma equação de segundo grau (A, B e
#C) e:
#a) se DELTA for maior que zero: imprima “DUAS RAÍZES REAIS”;
#b) se DELTA for igual a zero: imprima apenas “UMA RAÍZ REAL”;
#c) se DELTA menor que zero: imprima a mensagem “NÃO EXISTEM RAÍZES REAIS”.
#(Não é necessário calcular as raízes caso existam).

.data
	 valora: .asciiz "Digite O Valor De A: "
	 valorb: .asciiz "Digite O Valor De B: "
	 valorc: .asciiz "Digite O Valor De C: "
	 duasraizes: .asciiz "Delta Tem Duas Raizes! Delta =  "
	 umaraiz: .asciiz "Delta Só Tem Uma Raiz! Delta =  "
	 semraiz: .asciiz "Delta Não Tem Nemhuma Raiz! Total =  "
	 linha: .asciiz "\n"
	 
.text
main:
	li $v0,4
	la $a0,valora
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,4
	la $a0,valorb
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,valorc
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	
	li $t3,4
	
	mul $t1,$t1,$t1 #B Ao Quadrado
	mul $t0,$t0,$t2 #A vezes C
	mul $t0,$t0,$t3 # 4 vezes a x c
	sub $t0,$t1,$t0 # B ao quadrado - 4.a.c
	
	beq $t0,$zero,fimuma_raiz #Se For Igual
	bgt $t0,$zero,fimduas_raiz #Se For Maior
	blt $t0,$zero,fimsem_raiz #Se For Menor:
	
	fimuma_raiz:
	li $v0,4
	la $a0,umaraiz
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	
	li $v0,10
	syscall
	
	fimduas_raiz:
	li $v0,4
	la $a0,duasraizes
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	
	
	
	li $v0,10
	syscall
	
	fimsem_raiz:
	li $v0,4
	la $a0,semraiz
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	
	