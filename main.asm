.include "desenha_original.asm"

			.text
			.globl main
main:
			li $t1, 0
			li $t2, 0
			li $t3, 0
			li $t4, 0
			li $t5, 0
			li $t6, 0
			li $t7, 0
			li $t8, 0
			li $t9, 0
			li $s6, 33

			li $s0, 0
			li $s5, 0

			la $s1, board
			la $s2, askMove
			la $s3, won
			draw_MAPA()
			
			lb $a1, clean
			sb $a1, 1($s1)
			sb $a1, 2($s1)
			sb $a1, 3($s1)
			sb $a1, 4($s1)
			sb $a1, 5($s1)
			sb $a1, 6($s1)
			sb $a1, 7($s1)
			sb $a1, 8($s1)
			sb $a1, 9($s1)

PrintBoard:

			beq $s5, 9, Tie

			add $s5, $s5, 1

			rem $t0, $s0, 2
			add $s0, $s0, 1
			bnez $t0, Player0

PlayerX:
			lb $a1, x
			sb $a1, 8($s2)
			sb $a1, 14($s3)
			j Play
Player0:
			lb $a1, o
			sb $a1, 8($s2)
			sb $a1, 14($s3)

Play:
			li $v0, 4
			la $a0, askMove
			syscall

			li $v0, 5
			syscall
			move $s6, $v0
			
			beq $s6, 11, J11
			beq $s6, 21, J21
			beq $s6, 31, J31
			beq $s6, 12, J12
			beq $s6, 22, J22
			beq $s6, 32, J32
			beq $s6, 13, J13
			beq $s6, 23, J23
			beq $s6, 33, J33

			li $v0, 4
			la $a0, invalidMove
			syscall
			j Play

J11:


			bnez $t1, Occupied
			bnez $t0, O11

			X11:
                        li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t1, 1
			sb $a1, 1($s1)
			li $a3,1
			li $a2,1
			joga()
			j CheckVictory

			O11:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t1, 2
			sb $a1, 1($s1)
			li $a3,2
			li $a2,1
			joga()
			j CheckVictory

J21:
			bnez $t2, Occupied
			bnez $t0, O21

			X21:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t2, 1
			sb $a1, 2($s1)
			li $a3,1
			li $a2,2
			joga()
			j CheckVictory

			O21:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t2, 2
			sb $a1, 2($s1)
			li $a3,2
			li $a2,2
			joga()
			j CheckVictory

J31:
			bnez $t3, Occupied
			bnez $t0, O31

			X31:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t3, 1
			sb $a1, 3($s1)
			li $a3,1
			li $a2,3
			joga()
			j CheckVictory

			O31:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t3, 2
			sb $a1, 3($s1)
			li $a3,2
			li $a2,3
			joga()
			j CheckVictory

J12:
			bnez $t4, Occupied
			bnez $t0, O12

			X12:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t4, 1
			sb $a1, 4($s1)
			li $a3,1
			li $a2,4
			joga()
			j CheckVictory

			O12:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t4, 2
			sb $a1, 4($s1)
			li $a3,2
			li $a2,4
			joga()
			j CheckVictory

J22:
			bnez $t5, Occupied
			bnez $t0, O22

			X22:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t5, 1
			sb $a1, 5($s1)
			li $a3,1
			li $a2,5
			joga()
			j CheckVictory

			O22:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t5, 2
			sb $a1, 5($s1)
			li $a3,2
			li $a2,5
			joga()
			j CheckVictory

J32:
			bnez $t6, Occupied
			bnez $t0, O32

			X32:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t6, 1
			sb $a1, 6($s1)
			li $a3,1
			li $a2,6
			joga()
			j CheckVictory

			O32:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t6, 2
			sb $a1, 6($s1)
			li $a3,2
			li $a2,6
			joga()
			j CheckVictory

J13:
			bnez $t7, Occupied
			bnez $t0, O13

			X13:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t7, 1
			sb $a1, 7($s1)
			li $a3,1
			li $a2,7
			joga()
			j CheckVictory

			O13:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t7, 2
			sb $a1, 7($s1)
			li $a3,2
			li $a2,7
			joga()
			j CheckVictory

J23:
			bnez $t8, Occupied
			bnez $t0, O23

			X23:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t8, 1
			sb $a1, 8($s1)
			li $a3,1
			li $a2,8
			joga()
			j CheckVictory

			O23:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t8, 2
			sb $a1, 8($s1)
			li $a3,2
			li $a2,8
			joga()
			j CheckVictory

J33:
			bnez $t9, Occupied
			bnez $t0, O33

			X33:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t9, 1
			sb $a1, 9($s1)
			li $a3,1
			li $a2,9
			joga()
			j CheckVictory

			O33:
			li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			li $t9, 2
			sb $a1, 9($s1)
			li $a3,2
			li $a2,9
			joga()
			j CheckVictory

Occupied:
			li $v0, 4
			la $a0, occupiedSpace
			syscall
			j Play

CheckVictory:
			and $s7, $t1, $t2
			and $s7, $s7, $t3
			bnez $s7, Victory

			and $s7, $t4, $t5
			and $s7, $s7, $t6
			bnez $s7, Victory

			and $s7, $t7, $t8
			and $s7, $s7, $t9
			bnez $s7, Victory

			and $s7, $t1, $t4
			and $s7, $s7, $t7
			bnez $s7, Victory

			and $s7, $t2, $t5
			and $s7, $s7, $t8
			bnez $s7, Victory

			and $s7, $t3, $t6
			and $s7, $s7, $t9
			bnez $s7, Victory

			and $s7, $t1, $t5
			and $s7, $s7, $t9
			bnez $s7, Victory

			and $s7, $t7, $t5
			and $s7, $s7, $t3
			bnez $s7, Victory
			j PrintBoard

Victory:
			
			li $t2, 122
                    
			li $v0, 4
			la $a0, won
			syscall
			li $t2, 10
                        li $a0, 62 
                        li $a1, 500  
                        move $a2, $t2
                        li $a3, 120
                        la $v0, 33
                        syscall
			draw_MAPA()
			j MenuNewGame

Tie:
			
			draw_MAPA()
			li $v0, 4
			la $a0, tie
			syscall

MenuNewGame:
			li $v0,4
			la $a0, gameMenu
			syscall

			li $v0,5
			syscall
			bne $v0, 99, main

			li $v0, 10
			syscall


			.data
			board: .asciiz "         "
			askMove: .asciiz "Jogador   digite a posição escolhida (coluna|linha):"
			invalidMove: .asciiz "**Movimento Inválido!**"
			occupiedSpace: .asciiz "**Posição ocupada!**\n"
			x: .asciiz "X"
			o: .asciiz "O"
			won: .asciiz "\nO vencedor é  !"
			tie: .asciiz  "\nEmpate"
			gameMenu: .asciiz "\n\nMenu:\n[1] Jogar Novamente\t[99] Sair\n"
			clean: .byte ' '

