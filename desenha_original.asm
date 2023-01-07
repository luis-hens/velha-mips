.data
	BaseAddress: .word 0x10040000
	yellow: .word 0xFFFF00
	white: .word 0xFFFFFF
	green: .word 0x00FF00
	bkp_1: .word 0
	bkp_2: .word 0
	bkp_3: .word 0
	bkp_4: .word 0
	bkp_5: .word 0
	bkp_6: .word 0
.text
#todo
# - (18) Macros plotar jogada 1-9
# - Implementar c musiquinha

.macro joga # $a3 - jogador } $a2 - posicao
	beq $a3,1,jogador_x
	beq $a3,2,jogador_o
	
	jogador_x:
		lw $a0,green
		beq $a2,1,pos_1_x
		beq $a2,2,pos_2_x
		beq $a2,3,pos_3_x
		beq $a2,4,pos_4_x
		beq $a2,5,pos_5_x
		beq $a2,6,pos_6_x
		beq $a2,7,pos_7_x
		beq $a2,8,pos_8_x
		beq $a2,9,pos_9_x
		pos_1_x:
			jogador_x_11()
			j finalizada_jogada
		pos_2_x:
			jogador_x_21()
			j finalizada_jogada
		pos_3_x:
			jogador_x_31()
			j finalizada_jogada
		pos_4_x:
			jogador_x_12()
			j finalizada_jogada
		pos_5_x:
			jogador_x_22()
			j finalizada_jogada
		pos_6_x:
			jogador_x_32()
			j finalizada_jogada
		pos_7_x:
			jogador_x_13()
			j finalizada_jogada
		pos_8_x:
			jogador_x_23()
			j finalizada_jogada
		pos_9_x:
			jogador_x_33()
			j finalizada_jogada

	jogador_o:
		lw $a0,white
		beq $a2,1,pos_1_o
		beq $a2,2,pos_2_o
		beq $a2,3,pos_3_o
		beq $a2,4,pos_4_o
		beq $a2,5,pos_5_o
		beq $a2,6,pos_6_o
		beq $a2,7,pos_7_o
		beq $a2,8,pos_8_o
		beq $a2,9,pos_9_o
		pos_1_o:
			jogador_o_11()
			j finalizada_jogada
		pos_2_o:
			jogador_o_21()
			j finalizada_jogada
		pos_3_o:
			jogador_o_31()
			j finalizada_jogada
		pos_4_o:
			jogador_o_12()
			j finalizada_jogada
		pos_5_o:
			jogador_o_22()
			j finalizada_jogada
		pos_6_o:
			jogador_o_32()
			j finalizada_jogada
		pos_7_o:
			jogador_o_13()
			j finalizada_jogada
		pos_8_o:
			jogador_o_23()
			j finalizada_jogada
		pos_9_o:
			jogador_o_33()
			j finalizada_jogada
	
	finalizada_jogada:
	
.end_macro

.macro salva_s1_s2
	sw $s1,bkp_4
	sw $s2,bkp_5
.end_macro

.macro volta_s1_s2
	lw $s1,bkp_4
	lw $s2,bkp_5
.end_macro

.macro draw_P #a3 cor - s1 pos_x, s2 pos_y
	#bkp $t0, $t1, $t2
	sw $t0,bkp_1
	sw $t1,bkp_2
	sw $t2,bkp_3
	
	#seta pra usar aqui
	lw $t0, BaseAddress
	li $t1,0
	li $t2,0
	
	#multiplica por 4
	add $t1,$s1,$s1
	add $t1,$t1,$t1
	
	#passa para heap
	add $t0,$t1,$t0
	
	addi $t1,$zero,0
	addi $t2,$zero,0	
	#multiplixa y
	beq $s2,$zero,printa
	loop_y:
		addi $t1,$t1,64
		addi $t2,$t2,1
		bne $t2,$s2,loop_y
	
	add $t0,$t0,$t1
	printa:
		sw $a0,($t0)
	
	#volta valores de $t0, $t1, $t2
	lw $t0,bkp_1
	lw $t1,bkp_2
	lw $t2,bkp_3
.end_macro

.macro jogador_x_11
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 1
	addi $s2, $zero, 1
	draw_P()
	addi $s1, $zero, 2
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 3
	draw_P()
	addi $s1, $zero, 4
	addi $s2, $zero, 4
	draw_P()
	#segunda barra diagonal X
	addi $s1, $zero, 4
	addi $s2, $zero, 1
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 2
	addi $s2, $zero, 3
	draw_P()
	addi $s1, $zero, 1
	addi $s2, $zero, 4
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_x_12
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 1
	addi $s2, $zero, 6
	draw_P()
	addi $s1, $zero, 2
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 8
	draw_P()
	addi $s1, $zero, 4
	addi $s2, $zero, 9
	draw_P()
	#segunda barra diagonal X
	addi $s1, $zero, 4
	addi $s2, $zero, 6
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 2
	addi $s2, $zero, 8
	draw_P()
	addi $s1, $zero, 1
	addi $s2, $zero, 9
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_x_13
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 1
	addi $s2, $zero, 11
	draw_P()
	addi $s1, $zero, 2
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 13
	draw_P()
	addi $s1, $zero, 4
	addi $s2, $zero, 14
	draw_P()
	#segunda barra diagonal X
	addi $s1, $zero, 4
	addi $s2, $zero, 11
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 2
	addi $s2, $zero, 13
	draw_P()
	addi $s1, $zero, 1
	addi $s2, $zero, 14
	draw_P()
	volta_s1_s2()
.end_macro
.macro jogador_x_21
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 6
	addi $s2, $zero, 1
	draw_P()
	addi $s1, $zero, 7
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 3
	draw_P()
	addi $s1, $zero, 9
	addi $s2, $zero, 4
	draw_P()
	#segunda barra diagonal X
	addi $s1, $zero, 9
	addi $s2, $zero, 1
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 7
	addi $s2, $zero, 3
	draw_P()
	addi $s1, $zero, 6
	addi $s2, $zero, 4
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_x_22
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 6
	addi $s2, $zero, 6
	draw_P()
	addi $s1, $zero, 7
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 8
	draw_P()
	addi $s1, $zero, 9
	addi $s2, $zero, 9
	draw_P()
	#segunda barra diagonal X
	addi $s1, $zero, 9
	addi $s2, $zero, 6
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 7
	addi $s2, $zero, 8
	draw_P()
	addi $s1, $zero, 6
	addi $s2, $zero, 9
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_x_23
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 6
	addi $s2, $zero, 11
	draw_P()
	addi $s1, $zero, 7
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 13
	draw_P()
	addi $s1, $zero, 9
	addi $s2, $zero, 14
	draw_P()
	#segunda barra diagonal X
	addi $s1, $zero, 9
	addi $s2, $zero, 11
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 7
	addi $s2, $zero, 13
	draw_P()
	addi $s1, $zero, 6
	addi $s2, $zero, 14
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_x_31
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 11
	addi $s2, $zero, 1
	draw_P()
	addi $s1, $zero, 12
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 3
	draw_P()
	addi $s1, $zero, 14
	addi $s2, $zero, 4
	draw_P()
	#segunda barra diagonal X
	addi $s1, $zero, 14
	addi $s2, $zero, 1
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 12
	addi $s2, $zero, 3
	draw_P()
	addi $s1, $zero, 11
	addi $s2, $zero, 4
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_x_32
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 11
	addi $s2, $zero, 6
	draw_P()
	addi $s1, $zero, 12
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 8
	draw_P()
	addi $s1, $zero, 14
	addi $s2, $zero, 9
	draw_P()
	#segunda barra diagonal X
	addi $s1, $zero, 14
	addi $s2, $zero, 6
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 12
	addi $s2, $zero, 8
	draw_P()
	addi $s1, $zero, 11
	addi $s2, $zero, 9
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_x_33
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 11
	addi $s2, $zero, 11
	draw_P()
	addi $s1, $zero, 12
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 13
	draw_P()
	addi $s1, $zero, 14
	addi $s2, $zero, 14
	draw_P()
	#segunda barra diagonal X
	addi $s1, $zero, 14
	addi $s2, $zero, 11
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 12
	addi $s2, $zero, 13
	draw_P()
	addi $s1, $zero, 11
	addi $s2, $zero, 14
	draw_P()
	volta_s1_s2()
.end_macro


# jogadas bola

.macro jogador_o_11
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 2
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 2
	addi $s2, $zero, 3
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 3
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_o_12
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 2
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 2
	addi $s2, $zero, 8
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 8
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_o_13
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 2
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 2
	addi $s2, $zero, 13
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 3
	addi $s2, $zero, 13
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_o_21
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 7
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 7
	addi $s2, $zero, 3
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 3
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_o_22
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 7
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 7
	addi $s2, $zero, 8
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 8
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_o_23
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 7
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 7
	addi $s2, $zero, 13
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 8
	addi $s2, $zero, 13
	draw_P()
	volta_s1_s2()
.end_macro



.macro jogador_o_31
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 12
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 12
	addi $s2, $zero, 3
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 2
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 3
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_o_32
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 12
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 12
	addi $s2, $zero, 8
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 7
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 8
	draw_P()
	volta_s1_s2()
.end_macro

.macro jogador_o_33
	salva_s1_s2()
	#primeira barra diagonal X
	addi $s1, $zero, 12
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 12
	addi $s2, $zero, 13
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 12
	draw_P()
	addi $s1, $zero, 13
	addi $s2, $zero, 13
	draw_P()
	volta_s1_s2()
.end_macro

############################################
# Desenha tabuleiro			   #
#
# Posicao 1.1
# x = 1 | x = 4
# y = 1 } y = 4
#
# Posicao 1.2
# x = 1 | x = 4 
# y = 6 } y = 9
#
# Posicao 1.3
# x = 1 | x = 4
# y = 11 } y = 14
# ----------------------------------------
# Posicao 2.1
# x = 6 | x = 9
# y = 1 } y = 4
#
# Posicao 2.2
# x = 6 | x = 9 
# y = 6 } y = 9
#
# Posicao 2.3
# x = 6 | x = 9
# y = 11 } y = 14
# ---------------------------------------
# Posicao 3.1
# x = 11 | x = 14
# y = 1 } y = 4
#
# Posicao 3.2
# x = 11 | x = 14 
# y = 6 } y = 9
#
# Posicao 3.3
# x = 11 | x = 14
# y = 11 } y = 14
###########################################
.macro draw_MAPA
	salva_s1_s2()
	lw $a0,yellow
	#Pos 1
	addi $s1, $zero, 1
	addi $s2, $zero, 1
	draw_P()
	#
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos1.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 1.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
	
	addi $s1,$zero,2
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos1.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 1.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
		
	addi $s1,$zero,3
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos1.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 1.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
		
	addi $s1,$zero,4
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos1.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 1.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
	#Fim pos 1
	
	#Pos 2
	addi $s1,$zero,6
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos2.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 2.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
	
	addi $s1,$zero,7
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos2.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 2.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
		
	addi $s1,$zero,8
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos2.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 2.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
		
	addi $s1,$zero,9
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos2.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 2.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
	#fim Pos 2
	
	#Pos 3
	addi $s1,$zero,11
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos3.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 3.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
		
	addi $s1,$zero,12
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos3.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 3.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
		
	addi $s1,$zero,13
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos3.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 3.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
		
	addi $s1,$zero,14
	addi $s2,$zero,1
	draw_P()
	addi $s2, $zero, 2
	draw_P()
	addi $s2, $zero, 3
	draw_P()
	addi $s2, $zero, 4
	draw_P()
		#barra pos3.2
		addi $s2,$zero,6
		draw_P()
		addi $s2,$zero,7
		draw_P()
		addi $s2,$zero,8
		draw_P()
		addi $s2,$zero,9
		draw_P()
		
		#barra pos 3.3
		addi $s2,$zero,11
		draw_P()
		addi $s2,$zero,12
		draw_P()
		addi $s2,$zero,13
		draw_P()
		addi $s2,$zero,14
		draw_P()
	
	volta_s1_s2()
.end_macro
