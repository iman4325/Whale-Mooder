###########################
# MOOD WHALE 		  #	
# 4x4 UNIT PIXELS	  #
# 256X256 DISPLAY PIXELS  #
# static data 		  #
###########################	
#     IMAN TANZEEM        #
#	IXT90001	  #
###########################

# width of screen in pixels 
.eqv WIDTH 64
# height of screen in pixels
.eqv HEIGHT 64
# colors
.eqv	GREEN	0x0000FF00
.eqv	RED	0x00F9C6B2
.eqv	TAN	0x00E7E7D6
.eqv	BLUE	0X002A8AC4
.eqv	BLACK	0X00050303
.eqv	YELLOW	0x00FFFC3C
.eqv	NAVY	0x000A2EF9
.eqv	ORANGE	0x00F79500
.eqv	OLIVE	0x0062A61D
.eqv MEM 0x10010000 

	.text
# draws the ocean floor 
background1:
	li	$t0, 0
	li	$t1, 0
	addi 	$a0, $0, 0    # a0 = X = WIDTH/2
	sra 	$a0, $a0, 1
	addi 	$a1, $0, 126  # a1 = Y = HEIGHT/2
	sra 	$a1, $a1, 1
	addi 	$a2, $0, TAN  # a2 = red (ox00RRGGBB)
	jal 	draw_pixel
background2:
	beq     $t0, 63, moveup
	addi	$a0, $a0, 1
	addi	$a2, $0, TAN
	addi	$t0,$t0,1
	jal	draw_pixel
moveup:
	addi	$a0,$a0,1
	subi	$a1,$a1,1
	add	$t0,$zero,$zero
	li	$t1, 1
	addi	$a2, $0, TAN
	j	background3
background3:
	beq     $t0, 576,waterreset
	subi	$a0, $a0, 1
	addi	$a2, $0, TAN
	addi	$t0,$t0,1
	jal	draw_pixel
	
# resets the counter 
waterreset:
	add	$t0,$zero,$zero
	li	$t1,2
###### DRAW WATER BACKGroUND ########
water:
	beq     $t0, 3456,changet1
	subi	$a0, $a0, 1
	addi	$a2, $0, BLUE
	addi	$t0,$t0,1
	jal	draw_pixel	
changet1:
	li	$t1, 4		# indicator for the change 1 function
	add	$t0,$zero,$zero	# resets counter
	j	fish
	
###### DRAW WHALE FUNCTION ########
fish:
	beq	$t0,1,resetdown
	addi 	$a0, $0, 40    	# a0 = X = WIDTH/2
	sra 	$a0, $a0, 1
	addi 	$a1, $0, 40  	# a1 = Y = HEIGHT/2
	sra 	$a1, $a1, 1
	addi 	$a2, $0, RED  	# a2 = red (ox00RRGGBB)
	add	$t0,$t0,1
	li	$t1, 5
	jal 	draw_pixel
##### DRAWS THE OUTERRIM OF THE WHALE ########
# DEFAULT COLOR IS RED 
resetdown:
	add	$t0,$zero,$zero
	j	fishdown
fishdown:
	beq	$t0, 15, resetbottom
	addi	$a1,$a1,1	# moves down to cover the outterim of the whale
	addi	$t0,$t0,1	# counter
	addi	$a2, $0, RED
	j	draw_pixel
resetbottom:
	add	$t0,$zero,$zero
	li	$t1,6
	j	fishdown
fishbottom:
	beq	$t0, 20, resetup
	addi	$a0,$a0,1	# covers the bottom outerim of the whale 
	addi	$t0,$t0,1	# counter
	addi	$a2, $0, RED
	j	draw_pixel	
resetup:
	add	$t0,$zero,$zero
	li	$t1,7
	j	fishup
fishup:
	beq	$t0, 15, resettop
	subi	$a1,$a1,1	# covers the side part outterim of the whale 
	addi	$t0,$t0,1	# counter
	addi	$a2, $0, RED
	j	draw_pixel	
resettop:
	add	$t0,$zero,$zero
	li	$t1,8
	j	fishtop
fishtop:
	beq	$t0, 19, resetinside1
	subi	$a0,$a0,1	# covers the top part outerrim of the whale 
	addi	$t0,$t0,1	# counter
	addi	$a2, $0, RED
	j	draw_pixel

###### DRAWS THE INSIDE OF THE WHALE #########
#starts at the position where the outterim left off at
resetinside1:
	add	$t0,$zero,$zero
	li	$t1,9
	addi	$a0,$a0,1
	j	fishinside1
fishinside1:
	beq	$t0, 14, resetinside2
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside2:	
	add	$t0,$zero,$zero
	li	$t1,10
	j	fishinside2
fishinside2:
	beq	$t0, 17, resetinside3
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside3:	
	add	$t0,$zero,$zero
	li	$t1,11
	j	fishinside3
fishinside3:
	beq	$t0, 13, resetinside4
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside4:
	add	$t0,$zero,$zero
	li	$t1,12
	j	fishinside4
fishinside4:
	beq	$t0, 16, resetinside5
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside5:
	add	$t0,$zero,$zero
	li	$t1,13
	j	fishinside5
fishinside5:
	beq	$t0, 12, resetinside6
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside6:
	add	$t0,$zero,$zero
	li	$t1,14
	j	fishinside6
fishinside6:
	beq	$t0, 15, resetinside7
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside7:
	add	$t0,$zero,$zero
	li	$t1,15
	j	fishinside7
fishinside7:
	beq	$t0, 11, resetinside8
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside8:
	add	$t0,$zero,$zero
	li	$t1,16
	j	fishinside8
fishinside8:
	beq	$t0, 14, resetinside9
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside9:
	add	$t0,$zero,$zero
	li	$t1,17
	j	fishinside9
fishinside9:
	beq	$t0, 10, resetinside10
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside10:
	add	$t0,$zero,$zero
	li	$t1,18
	j	fishinside10
fishinside10:
	beq	$t0, 13, resetinside11
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside11:
	add	$t0,$zero,$zero
	li	$t1,19
	j	fishinside11
fishinside11:
	beq	$t0, 9, resetinside12
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside12:
	add	$t0,$zero,$zero
	li	$t1,20
	j	fishinside12
fishinside12:
	beq	$t0, 12, resetinside13
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside13:
	add	$t0,$zero,$zero
	li	$t1,21
	j	fishinside13
fishinside13:
	beq	$t0, 8, resetinside14
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside14:
	add	$t0,$zero,$zero
	li	$t1,22
	j	fishinside14
fishinside14:
	beq	$t0, 11, resetinside15
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside15:
	add	$t0,$zero,$zero
	li	$t1,23
	j	fishinside15
fishinside15:
	beq	$t0, 7, resetinside16
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside16:
	add	$t0,$zero,$zero
	li	$t1,24
	j	fishinside16
fishinside16:
	beq	$t0, 10, resetinside17
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside17:
	add	$t0,$zero,$zero
	li	$t1,25
	j	fishinside17
fishinside17:
	beq	$t0, 6, resetinside18
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside18:
	add	$t0,$zero,$zero
	li	$t1,26
	j	fishinside18
fishinside18:
	beq	$t0, 9, resetinside19
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside19:
	add	$t0,$zero,$zero
	li	$t1,27
	j	fishinside19
fishinside19:
	beq	$t0, 5, resetinside20
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside20:
	add	$t0,$zero,$zero
	li	$t1,28
	j	fishinside20
fishinside20:
	beq	$t0, 8, resetinside21
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside21:
	add	$t0,$zero,$zero
	li	$t1,29
	j	fishinside21
fishinside21:
	beq	$t0, 4, resetinside22
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside22:
	add	$t0,$zero,$zero
	li	$t1,30
	j	fishinside22
fishinside22:
	beq	$t0, 7, resetinside23
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside23:
	add	$t0,$zero,$zero
	li	$t1,31
	j	fishinside23
fishinside23:
	beq	$t0, 3, resetinside24
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside24:
	add	$t0,$zero,$zero
	li	$t1,32
	j	fishinside24
fishinside24:
	beq	$t0, 6, resetinside25
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside25:
	add	$t0,$zero,$zero
	li	$t1,33
	j	fishinside25
fishinside25:
	beq	$t0, 2, resetinside26
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside26:
	add	$t0,$zero,$zero
	li	$t1,34
	j	fishinside26
fishinside26:
	beq	$t0, 5, resetinside27
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside27:
	add	$t0,$zero,$zero
	li	$t1,35
	j	fishinside27
fishinside27:
	beq	$t0, 1, resetinside28
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
resetinside28:
	add	$t0,$zero,$zero
	li	$t1,36
	j	fishinside28
fishinside28:
	beq	$t0, 4, reseteye
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, RED
	j	draw_pixel
	
######## DRAWS THE WHALES EYE ##########
reseteye:
	add	$t0,$zero,$zero
	li	$t1,37
	j	fisheye
fisheye:
	beq	$t0,1,resettail1
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2, $0, BLACK
	j	draw_pixel

####### DRAWS THE WHALES TAIL ###########
resettail1:
	add	$t0,$zero,$zero
	li	$t1,38
	addi	$a0,$a0,11
	addi	$a1,$a1,2
	j	fishtail1
fishtail1:
	beq	$t0,6,resettail2
	addi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail2:
	add	$t0,$zero,$zero
	li	$t1,39
	j	fishtail1
fishtail2:
	beq	$t0,12,resettail3
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail3:
	add	$t0,$zero,$zero
	li	$t1,40
	j	fishtail3
fishtail3:
	beq	$t0,5,resettail4
	subi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail4:
	add	$t0,$zero,$zero
	li	$t1,41
	j	fishtail3
fishtail4:
	beq	$t0,6,resettail5
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail5:
	add	$t0,$zero,$zero
	li	$t1,42
	j	fishtail5
fishtail5:
	beq	$t0,4,resettail6
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail6:
	add	$t0,$zero,$zero
	li	$t1,43
	j	fishtail6
fishtail6:
	beq	$t0,3,resettail7
	subi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail7:
	add	$t0,$zero,$zero
	li	$t1,44
	j	fishtail7
fishtail7:
	beq	$t0,2,resettail8
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail8:
	add	$t0,$zero,$zero
	li	$t1,45
	j	fishtail8
fishtail8:
	beq	$t0,1,resettail9
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail9:
	add	$t0,$zero,$zero
	li	$t1,46
	j	fishtail9
fishtail9:
	beq	$t0,4,resettail10
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail10:
	add	$t0,$zero,$zero
	li	$t1,47
	j	fishtail10
fishtail10:
	beq	$t0,1,resettail11
	addi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail11:
	add	$t0,$zero,$zero
	li	$t1,48
	j	fishtail11
fishtail11:
	beq	$t0,2,resettail12
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel
resettail12:
	add	$t0,$zero,$zero
	li	$t1,49
	j	fishtail12
fishtail12:
	beq	$t0,2,resetsmile
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$a2,$0, RED
	j	draw_pixel

##### DRAWS THE WHALES SMILE###########
resetsmile:
	li	$t0,0
smile:
	beq	$t0,1,resetsmile2
	li	$t1, 50
	addi 	$a0, $0, 40    # a0 = X = WIDTH/2
	sra 	$a0, $a0, 1
	addi 	$a1, $0, 62  # a1 = Y = HEIGHT/2
	sra 	$a1, $a1, 1
	addi 	$a2, $0, BLACK  # a2 = red (ox00RRGGBB)
	add	$t2,$t2,1
	addi	$t0,$t0,1
	j	draw_pixel
resetsmile2:
	li	$t0,0
	li	$t1,51
smile2:
	beq	$t0,1,resetsmile3
	addi	$a0,$a0,1	# moves to the right
	addi	$a1,$a1,1	# moves up
	addi	$a2,$0, BLACK
	addi	$t0,$t0,1
	j	draw_pixel
resetsmile3:
	li	$t0,0
	li	$t1,52
smile3:
	beq	$t0,1,moodsloop	#once counter is reached jump to moods loop
	addi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$a2,$0, BLACK
	addi	$t0,$t0,1
	j	draw_pixel
	
###### DRAW PIXEL FUNCTION USED TO DRAW BACKGROUND AND DEFAULT WHALE ########
draw_pixel:
	# s1 = address = MEM + 4*(x + y*width)
	mul	$s1, $a1, WIDTH   # y * WIDTH
	add	$s1, $s1, $a0	  # add X
	mul	$s1, $s1, 4	  # multiply by 4 to get word offset
	add	$s1, $s1, MEM	  # add to base address
	sw	$a2, 0($s1)	  # store color at memory location
	
	# t1 is used to distiniguish which function to loop back to based on 
	# the number 
	beq	$t1, 0, background2
	beq	$t1, 1, background3
	beq	$t1, 2, water
	beq	$t1, 5, fishdown
	beq	$t1, 6, fishbottom
	beq	$t1, 7, fishup
	beq	$t1, 8, fishtop
	beq	$t1, 9, fishinside1
	beq	$t1, 10, fishinside2
	beq	$t1, 11, fishinside3
	beq	$t1, 12, fishinside4
	beq	$t1, 13, fishinside5
	beq	$t1, 14, fishinside6
	beq	$t1, 15, fishinside7
	beq	$t1, 16, fishinside8
	beq	$t1, 17, fishinside9
	beq	$t1, 18, fishinside10
	beq	$t1, 19, fishinside11
	beq	$t1, 20, fishinside12
	beq	$t1, 21, fishinside13
	beq	$t1, 22, fishinside14
	beq	$t1, 23, fishinside15
	beq	$t1, 24, fishinside16
	beq	$t1, 25, fishinside17
	beq	$t1, 26, fishinside18
	beq	$t1, 27, fishinside19
	beq	$t1, 28, fishinside20
	beq	$t1, 29, fishinside21
	beq	$t1, 30, fishinside22
	beq	$t1, 31, fishinside23
	beq	$t1, 32, fishinside24
	beq	$t1, 33, fishinside25
	beq	$t1, 34, fishinside26
	beq	$t1, 35, fishinside27
	beq	$t1, 36, fishinside28
	beq	$t1, 37, fisheye
	beq	$t1, 38, fishtail1
	beq	$t1, 39, fishtail2
	beq	$t1, 40, fishtail3
	beq	$t1, 41, fishtail4
	beq	$t1, 42, fishtail5
	beq	$t1, 43, fishtail6
	beq	$t1, 44, fishtail7
	beq	$t1, 45, fishtail8
	beq	$t1, 46, fishtail9
	beq	$t1, 47, fishtail10
	beq	$t1, 48, fishtail11
	beq	$t1, 49, fishtail12
	beq	$t1, 50, smile
	beq	$t1, 51, smile2
	beq	$t1, 52, smile3
	jr 	$ra
	
######### MOOD REGESITER THAT IMPLEMENTS KEYBOARD EFFECT ###########	
moodsloop:	
	# check for input
	lw $t0, 0xffff0000  #t1 holds if input available
    	beq $t0, 0, moodsloop   #If no input, keep displaying
	
	# process input
	lw 	$s1, 0xffff0004
	beq	$s1, 32, exit		# input space
	beq	$s1, 104, setcounter 	# input h - happy
	beq	$s1, 115, setcounter2 	# input s - sad
	beq	$s1, 97, setcounter3  	# input a - angry
	beq	$s1, 110, setcounter4	# input n - nervous
	
	# invalid input, ignore
	j	moodsloop
	
####### HAPPY WHALE FUNCTION ###########

# turns the color of the whale to yellow to indicate user is feeling happy
setcounter:
	li	$t2, 0
	j	happywhale
	
###### COLORS THE OUTERRIM OF THE WHALE ###########
happywhale:
	li	$t6,0
	beq	$t2,1,happyresetdown
	addi 	$a0, $0, 40    		# a0 = X = WIDTH/2
	sra 	$a0, $a0, 1
	addi 	$a1, $0, 40  		# a1 = Y = HEIGHT/2
	sra 	$a1, $a1, 1
	addi 	$a2, $0, YELLOW         # a2 = red (ox00RRGGBB)
	add	$t2,$t2,1
	li	$t1, 5
	jal 	draw_mood
happyresetdown:
	add	$t2,$zero,$zero
	li	$t6,1
	j	happydown
happydown:
	beq	$t0, 16, happyresetbottom
	addi	$a1,$a1,1	# covers the outterim down side of the whale 
	addi	$t2,$t2,1	
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1	# counter
	j	draw_mood
happyresetbottom:
	add	$t2,$zero,$zero
	li	$t6,2
	j	happybottom
happybottom:
	beq	$t0, 35, happyresetup
	addi	$a0,$a0,1	# covers the outterim bottom of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1	# counter
	j	draw_mood	
happyresetup:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,3
	j	happyup
happyup:
	beq	$t0, 14, happyresettop
	subi	$a1,$a1,1	# covers the outterim up of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1	# counter 
	j	draw_mood
happyresettop:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,4
	j	happyup
happytop:
	beq	$t0, 19, happyresetinside1
	subi	$a0,$a0,1	# convers the outterim top of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1	# counter
	j	draw_mood
	
######## COLORS THE INSIDE OF THE HAPPY WHALE ########
happyresetinside1:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,5
	j	happyinside1
happyinside1:
	beq	$t0, 14, happyresetinside2
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside2:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,6
	j	happyinside2
happyinside2:
	beq	$t0, 17, happyresetinside3
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside3:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,7
	j	happyinside3
happyinside3:
	beq	$t0, 13, happyresetinside4
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside4:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,8
	j	happyinside4
happyinside4:
	beq	$t0, 16, happyresetinside5
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside5:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,9
	j	happyinside5
happyinside5:
	beq	$t0, 12, happyresetinside6
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside6:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,10
	j	happyinside6
happyinside6:
	beq	$t0, 15, happyresetinside7
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside7:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,11
	j	happyinside7
happyinside7:
	beq	$t0, 11, happyresetinside8
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside8:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,12
	j	happyinside8
happyinside8:
	beq	$t0, 14, happyresetinside9
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside9:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,13
	j	happyinside9
happyinside9:
	beq	$t0, 10, happyresetinside10
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside10:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,14
	j	happyinside10
happyinside10:
	beq	$t0, 13, happyresetinside11
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside11:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,15
	j	happyinside11
happyinside11:
	beq	$t0, 9, happyresetinside12
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside12:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,16
	j	happyinside12
happyinside12:
	beq	$t0, 12, happyresetinside13
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside13:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,17
	j	happyinside13
happyinside13:
	beq	$t0, 8, happyresetinside14
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside14:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,18
	j	happyinside14
happyinside14:
	beq	$t0, 11, happyresetinside15
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside15:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,19
	j	happyinside15
happyinside15:
	beq	$t0, 7, happyresetinside16
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside16:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,20
	j	happyinside16
happyinside16:
	beq	$t0, 10, happyresetinside17
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside17:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,21
	j	happyinside17
happyinside17:
	beq	$t0, 6, happyresetinside18
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside18:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,22
	j	happyinside18
happyinside18:
	beq	$t0, 9, happyresetinside19
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside19:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,23
	j	happyinside19
happyinside19:
	beq	$t0, 5, happyresetinside20
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside20:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,24
	j	happyinside20
happyinside20:
	beq	$t0, 8, happyresetinside21
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside21:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,25
	j	happyinside21
happyinside21:
	beq	$t0, 4, happyresetinside22
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside22:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,26
	j	happyinside22
happyinside22:
	beq	$t0, 7, happyresetinside23
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside23:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,27
	j	happyinside23
happyinside23:
	beq	$t0, 3, happyresetinside24
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside24:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,28
	j	happyinside24
happyinside24:
	beq	$t0, 6, happyresetinside25
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside25:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,29
	j	happyinside25
happyinside25:
	beq	$t0, 2, happyresetinside26
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside26:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,30
	j	happyinside26
happyinside26:
	beq	$t0, 5, happyresetinside27
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside27:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,31
	j	happyinside27
happyinside27:
	beq	$t0, 1, happyresetinside28
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresetinside28:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,32
	j	happyinside28
happyinside28:
	beq	$t0, 4, happyfisheyereset
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
	
####### DRAWS THE HAPPY WHALE EYE##########
happyfisheyereset:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,33
	j	happyfisheye
happyfisheye:
	beq	$t0, 1, happyresettail1
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, BLACK
	addi	$t0,$t0,1
	j	draw_mood
	
###### COLORS THE HAPPY WHALE TAIL###########
happyresettail1:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,34
	addi	$a0,$a0,11
	addi	$a1,$a1,2
	j	happyfishtail1
happyfishtail1:
	beq	$t0,7,happyresettail2
	addi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	addi	$t0,$t0,1
	j	draw_mood
happyresettail2:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,35
	j	happyfishtail2
happyfishtail2:
	beq	$t0,11,happyresettail3
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail3:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,36
	j	happyfishtail3
happyfishtail3:
	beq	$t0,5,happyresettail4
	subi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail4:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,37
	j	happyfishtail4
happyfishtail4:
	beq	$t0,5,happyresettail5
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail5:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,38
	j	happyfishtail5
happyfishtail5:
	beq	$t0,4,happyresettail6
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail6:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,39
	j	happyfishtail6
happyfishtail6:
	beq	$t0,3,happyresettail7
	subi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail7:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,40
	j	happyfishtail7
happyfishtail7:
	beq	$t0,2,happyresettail8
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail8:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,41
	j	happyfishtail8
happyfishtail8:
	beq	$t0,1,happyresettail9
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail9:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,42
	j	happyfishtail9
happyfishtail9:
	beq	$t0,6,happyresettail10
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail10:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,43
	j	happyfishtail10
happyfishtail10:
	beq	$t0,1,happyresettail11
	subi	$a0,$a0,1
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail11:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,44
	j	happyfishtail11
happyfishtail11:
	beq	$t0,2,happyresettail12
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail12:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,45
	j	happyfishtail12
happyfishtail12:
	beq	$t0,2,happyresettail13
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
happyresettail13:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,46
	j	happyfishtail13
happyfishtail13:
	beq	$t0,1,moodsloop
	subi	$a1,$a1,1
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, YELLOW
	j	draw_mood
	
######## DRAW PIXEL FUNCTION FOR THE HAPPY WHALE #########
draw_mood:
	# s1 = address = MEM + 4*(x + y*width)
	mul	$s1, $a1, WIDTH   # y * WIDTH
	add	$s1, $s1, $a0	  # add X
	mul	$s1, $s1, 4	  # multiply by 4 to get word offset
	add	$s1, $s1, MEM	  # add to base address
	sw	$a2, 0($s1)	  # store color at memory location
	
	# t6 is used to distiniguish which function to loop back to based on 
	# the number 
	beq	$t6,0, happywhale
	beq	$t6,1, happydown
	beq	$t6,2, happybottom
	beq	$t6,3, happyup
	beq	$t6,4, happytop
	beq	$t6,5, happyinside1
	beq	$t6,6, happyinside2
	beq	$t6,7, happyinside3
	beq	$t6,8, happyinside4
	beq	$t6,9, happyinside5
	beq	$t6,10, happyinside6
	beq	$t6,11, happyinside7
	beq	$t6,12, happyinside8
	beq	$t6,13, happyinside9
	beq	$t6,14, happyinside10
	beq	$t6,15, happyinside11
	beq	$t6,16, happyinside12
	beq	$t6,17, happyinside13
	beq	$t6,18, happyinside14
	beq	$t6,19, happyinside15
	beq	$t6,20, happyinside16
	beq	$t6,21, happyinside17
	beq	$t6,22, happyinside18
	beq	$t6,23, happyinside19
	beq	$t6,24, happyinside20
	beq	$t6,25, happyinside21
	beq	$t6,26, happyinside22
	beq	$t6,27, happyinside23
	beq	$t6,28, happyinside24
	beq	$t6,29, happyinside25
	beq	$t6,30, happyinside26
	beq	$t6,31, happyinside27
	beq	$t6,32, happyinside28
	beq	$t6,33, happyfisheye
	beq	$t6,34,	happyfishtail1
	beq	$t6,35,	happyfishtail2
	beq	$t6,36,	happyfishtail3
	beq	$t6,37,	happyfishtail4
	beq	$t6,38,	happyfishtail5
	beq	$t6,39,	happyfishtail6
	beq	$t6,40,	happyfishtail7
	beq	$t6,41,	happyfishtail8
	beq	$t6,42,	happyfishtail9
	beq	$t6,43,	happyfishtail10
	beq	$t6,44,	happyfishtail11
	beq	$t6,45,	happyfishtail12
	beq	$t6,46,	happyfishtail13
	jr	$ra
	
####### SAD WHALE FUNCTION ##############

# turns the color of the whale to navy to indicate user is feeling sad
setcounter2:
	li	$t2, 0
	j	sadwhale
	
##### COLORS THE OUTERRIM OF THE WHALE ########
sadwhale:
	li	$t6,0
	beq	$t2,1,sadresetdown
	addi 	$a0, $0, 40    # a0 = X = WIDTH/2
	sra 	$a0, $a0, 1
	addi 	$a1, $0, 40  # a1 = Y = HEIGHT/2
	sra 	$a1, $a1, 1
	addi 	$a2, $0, NAVY  # a2 = red (ox00RRGGBB)
	add	$t2,$t2,1
	li	$t1, 5
	jal 	draw_mood2
sadresetdown:
	add	$t2,$zero,$zero
	li	$t6,1
	j	saddown
saddown:
	beq	$t0, 16, sadresetbottom
	addi	$a1,$a1,1	# covers the outterim of the down side of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1	# counter
	j	draw_mood2
sadresetbottom:
	add	$t2,$zero,$zero
	li	$t6,2
	j	sadbottom
sadbottom:
	beq	$t0, 35, sadresetup
	addi	$a0,$a0,1	# covers the outtrim bottom of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1	# counter 
	j	draw_mood2	
sadresetup:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,3
	j	sadup
sadup:
	beq	$t0, 14, sadresettop
	subi	$a1,$a1,1	# covers the outterim up side of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1	# counter
	j	draw_mood2
sadresettop:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,4
	j	sadup
sadtop:
	beq	$t0, 19, sadresetinside1
	subi	$a0,$a0,1	# covers the outterim top of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1	# counter
	j	draw_mood2

####### COLORS THE INSIDE OF THE SAD WHALE NAVY ############
sadresetinside1:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,5
	j	sadinside1
sadinside1:
	beq	$t0, 14, sadresetinside2
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside2:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,6
	j	sadinside2
sadinside2:
	beq	$t0, 17, sadresetinside3
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside3:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,7
	j	sadinside3
sadinside3:
	beq	$t0, 13, sadresetinside4
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside4:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,8
	j	sadinside4
sadinside4:
	beq	$t0, 16, sadresetinside5
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside5:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,9
	j	sadinside5
sadinside5:
	beq	$t0, 12, sadresetinside6
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside6:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,10
	j	sadinside6
sadinside6:
	beq	$t0, 15, sadresetinside7
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside7:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,11
	j	sadinside7
sadinside7:
	beq	$t0, 11, sadresetinside8
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside8:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,12
	j	sadinside8
sadinside8:
	beq	$t0, 14, sadresetinside9
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside9:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,13
	j	sadinside9
sadinside9:
	beq	$t0, 10, sadresetinside10
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside10:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,14
	j	sadinside10
sadinside10:
	beq	$t0, 13, sadresetinside11
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside11:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,15
	j	sadinside11
sadinside11:
	beq	$t0, 9, sadresetinside12
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside12:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,16
	j	sadinside12
sadinside12:
	beq	$t0, 12, sadresetinside13
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside13:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,17
	j	sadinside13
sadinside13:
	beq	$t0, 8, sadresetinside14
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside14:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,18
	j	sadinside14
sadinside14:
	beq	$t0, 11, sadresetinside15
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside15:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,19
	j	sadinside15
sadinside15:
	beq	$t0, 7, sadresetinside16
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside16:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,20
	j	sadinside16
sadinside16:
	beq	$t0, 10, sadresetinside17
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside17:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,21
	j	sadinside17
sadinside17:
	beq	$t0, 6, sadresetinside18
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside18:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,22
	j	sadinside18
sadinside18:
	beq	$t0, 9, sadresetinside19
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside19:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,23
	j	sadinside19
sadinside19:
	beq	$t0, 5, sadresetinside20
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside20:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,24
	j	sadinside20
sadinside20:
	beq	$t0, 8, sadresetinside21
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside21:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,25
	j	sadinside21
sadinside21:
	beq	$t0, 4, sadresetinside22
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside22:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,26
	j	sadinside22
sadinside22:
	beq	$t0, 7, sadresetinside23
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside23:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,27
	j	sadinside23
sadinside23:
	beq	$t0, 3, sadresetinside24
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside24:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,28
	j	sadinside24
sadinside24:
	beq	$t0, 6, sadresetinside25
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside25:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,29
	j	sadinside25
sadinside25:
	beq	$t0, 2, sadresetinside26
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside26:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,30
	j	sadinside26
sadinside26:
	beq	$t0, 5, sadresetinside27
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside27:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,31
	j	sadinside27
sadinside27:
	beq	$t0, 1, sadresetinside28
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresetinside28:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,32
	j	sadinside28
sadinside28:
	beq	$t0, 4, sadfisheyereset
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
	
####### DRAWS THE SAD WHALE EYE #########
sadfisheyereset:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,33
	j	sadfisheye
sadfisheye:
	beq	$t0, 1, sadresettail1
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, BLACK
	addi	$t0,$t0,1
	j	draw_mood2
	
###### COLORS THE SAD WHALE TAIL############
sadresettail1:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,34
	addi	$a0,$a0,11
	addi	$a1,$a1,2
	j	sadfishtail1
sadfishtail1:
	beq	$t0,7,sadresettail2
	addi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	addi	$t0,$t0,1
	j	draw_mood2
sadresettail2:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,35
	j	sadfishtail2
sadfishtail2:
	beq	$t0,11,sadresettail3
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail3:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,36
	j	sadfishtail3
sadfishtail3:
	beq	$t0,5,sadresettail4
	subi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail4:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,37
	j	sadfishtail4
sadfishtail4:
	beq	$t0,5,sadresettail5
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail5:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,38
	j	sadfishtail5
sadfishtail5:
	beq	$t0,4,sadresettail6
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail6:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,39
	j	sadfishtail6
sadfishtail6:
	beq	$t0,3,sadresettail7
	subi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail7:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,40
	j	sadfishtail7
sadfishtail7:
	beq	$t0,2,sadresettail8
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail8:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,41
	j	sadfishtail8
sadfishtail8:
	beq	$t0,1,sadresettail9
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail9:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,42
	j	sadfishtail9
sadfishtail9:
	beq	$t0,6,sadresettail10
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail10:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,43
	j	sadfishtail10
sadfishtail10:
	beq	$t0,1,sadresettail11
	subi	$a0,$a0,1
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail11:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,44
	j	sadfishtail11
sadfishtail11:
	beq	$t0,2,sadresettail12
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail12:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,45
	j	sadfishtail12
sadfishtail12:
	beq	$t0,2,sadresettail13
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
sadresettail13:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,46
	j	sadfishtail13
sadfishtail13:
	beq	$t0,1,moodsloop
	subi	$a1,$a1,1
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, NAVY
	j	draw_mood2
	
######## DRAW PIXEL FIUNCTION FOR SAD WHALE ############
draw_mood2:
	# s1 = address = MEM + 4*(x + y*width)
	mul	$s1, $a1, WIDTH   # y * WIDTH
	add	$s1, $s1, $a0	  # add X
	mul	$s1, $s1, 4	  # multiply by 4 to get word offset
	add	$s1, $s1, MEM	  # add to base address
	sw	$a2, 0($s1)	  # store color at memory location
	
	# t6 is used to distiniguish which function to loop back to based on 
	# the number 
	beq	$t6,0, sadwhale
	beq	$t6,1,saddown
	beq	$t6,2,sadbottom
	beq	$t6,3,sadup
	beq	$t6,4,sadtop
	beq	$t6,5, sadinside1
	beq	$t6,6, sadinside2
	beq	$t6,7, sadinside3
	beq	$t6,8, sadinside4
	beq	$t6,9, sadinside5
	beq	$t6,10, sadinside6
	beq	$t6,11, sadinside7
	beq	$t6,12, sadinside8
	beq	$t6,13, sadinside9
	beq	$t6,14, sadinside10
	beq	$t6,15, sadinside11
	beq	$t6,16, sadinside12
	beq	$t6,17, sadinside13
	beq	$t6,18, sadinside14
	beq	$t6,19, sadinside15
	beq	$t6,20, sadinside16
	beq	$t6,21, sadinside17
	beq	$t6,22, sadinside18
	beq	$t6,23, sadinside19
	beq	$t6,24, sadinside20
	beq	$t6,25, sadinside21
	beq	$t6,26, sadinside22
	beq	$t6,27, sadinside23
	beq	$t6,28, sadinside24
	beq	$t6,29, sadinside25
	beq	$t6,30, sadinside26
	beq	$t6,31, sadinside27
	beq	$t6,32, sadinside28
	beq	$t6,33, sadfisheye
	beq	$t6,34, sadfishtail1
	beq	$t6,35, sadfishtail2
	beq	$t6,36, sadfishtail3
	beq	$t6,37, sadfishtail4
	beq	$t6,38, sadfishtail5
	beq	$t6,39, sadfishtail6
	beq	$t6,40, sadfishtail7
	beq	$t6,41, sadfishtail8
	beq	$t6,42, sadfishtail9
	beq	$t6,43, sadfishtail10
	beq	$t6,44, sadfishtail11
	beq	$t6,45, sadfishtail12
	beq	$t6,46, sadfishtail13
	jr	$ra
	
######## ANGRY WHALE FUNCION  ###################

# turns the color of the whale to orange to indicate user is feeling angry
setcounter3:
	li	$t2, 0
	j	angrywhale
	
######## COLORS THE OUTERRIM OF THE ANGRY WHALE ORANGE ##########
angrywhale:
	li	$t6,0
	beq	$t2,1,angryresetdown
	addi 	$a0, $0, 40    # a0 = X = WIDTH/2
	sra 	$a0, $a0, 1
	addi 	$a1, $0, 40  # a1 = Y = HEIGHT/2
	sra 	$a1, $a1, 1
	addi 	$a2, $0, ORANGE  # a2 = red (ox00RRGGBB)
	add	$t2,$t2,1
	li	$t1, 5
	jal 	draw_mood3
angryresetdown:
	add	$t2,$zero,$zero
	li	$t6,1
	j	angrydown
angrydown:
	beq	$t0, 16, angryresetbottom
	addi	$a1,$a1,1	# covers the outterim down side of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1	# counter 
	j	draw_mood3
angryresetbottom:
	add	$t2,$zero,$zero
	li	$t6,2
	j	angrybottom
angrybottom:
	beq	$t0, 35, angryresetup
	addi	$a0,$a0,1	# covers the outterim bottom of the whale 
	addi	$t2,$t2,1	
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1	# counter 
	j	draw_mood3	
angryresetup:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,3
	j	angryup
angryup:
	beq	$t0, 14, angryresettop
	subi	$a1,$a1,1	# covers the outterim up side of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1	# counter 
	j	draw_mood3
angryresettop:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,4
	j	angryup
angrytop:
	beq	$t0, 19, angryresetinside1
	subi	$a0,$a0,1	# covers the outtreim top of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1	# counter 
	j	draw_mood3
	
##### COLORS THE THE INSIDE OF THE ANGRY WHALE ORANGE#########
angryresetinside1:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,5
	j	angryinside1
angryinside1:
	beq	$t0, 14, angryresetinside2
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside2:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,6
	j	angryinside2
angryinside2:
	beq	$t0, 17, angryresetinside3
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside3:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,7
	j	angryinside3
angryinside3:
	beq	$t0, 13, angryresetinside4
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside4:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,8
	j	angryinside4
angryinside4:
	beq	$t0, 16, angryresetinside5
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside5:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,9
	j	angryinside5
angryinside5:
	beq	$t0, 12, angryresetinside6
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside6:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,10
	j	angryinside6
angryinside6:
	beq	$t0, 15, angryresetinside7
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside7:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,11
	j	angryinside7
angryinside7:
	beq	$t0, 11, angryresetinside8
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside8:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,12
	j	angryinside8
angryinside8:
	beq	$t0, 14, angryresetinside9
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside9:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,13
	j	angryinside9
angryinside9:
	beq	$t0, 10, angryresetinside10
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside10:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,14
	j	angryinside10
angryinside10:
	beq	$t0, 13, angryresetinside11
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside11:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,15
	j	angryinside11
angryinside11:
	beq	$t0, 9, angryresetinside12
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside12:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,16
	j	angryinside12
angryinside12:
	beq	$t0, 12, angryresetinside13
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside13:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,17
	j	angryinside13
angryinside13:
	beq	$t0, 8, angryresetinside14
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside14:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,18
	j	angryinside14
angryinside14:
	beq	$t0, 11, angryresetinside15
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside15:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,19
	j	angryinside15
angryinside15:
	beq	$t0, 7, angryresetinside16
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside16:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,20
	j	angryinside16
angryinside16:
	beq	$t0, 10, angryresetinside17
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside17:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,21
	j	angryinside17
angryinside17:
	beq	$t0, 6, angryresetinside18
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside18:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,22
	j	angryinside18
angryinside18:
	beq	$t0, 9, angryresetinside19
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside19:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,23
	j	angryinside19
angryinside19:
	beq	$t0, 5, angryresetinside20
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside20:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,24
	j	angryinside20
angryinside20:
	beq	$t0, 8, angryresetinside21
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside21:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,25
	j	angryinside21
angryinside21:
	beq	$t0, 4, angryresetinside22
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside22:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,26
	j	angryinside22
angryinside22:
	beq	$t0, 7, angryresetinside23
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside23:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,27
	j	angryinside23
angryinside23:
	beq	$t0, 3, angryresetinside24
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside24:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,28
	j	angryinside24
angryinside24:
	beq	$t0, 6, angryresetinside25
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside25:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,29
	j	angryinside25
angryinside25:
	beq	$t0, 2, angryresetinside26
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside26:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,30
	j	angryinside26
angryinside26:
	beq	$t0, 5, angryresetinside27
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside27:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,31
	j	angryinside27
angryinside27:
	beq	$t0, 1, angryresetinside28
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresetinside28:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,32
	j	angryinside28
angryinside28:
	beq	$t0, 4, angryfisheyereset
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3

##### DRAWS THE ANGRY WHALE EYE ##########
angryfisheyereset:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,33
	j	angryfisheye
angryfisheye:
	beq	$t0, 1, angryresettail1
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, BLACK
	addi	$t0,$t0,1
	j	draw_mood3
	
###### DRAWS THE ANGRY WHALE TAIL##########
angryresettail1:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,34
	addi	$a0,$a0,11
	addi	$a1,$a1,2
	j	angryfishtail1
angryfishtail1:
	beq	$t0,7,angryresettail2
	addi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	addi	$t0,$t0,1
	j	draw_mood3
angryresettail2:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,35
	j	angryfishtail2
angryfishtail2:
	beq	$t0,11,angryresettail3
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail3:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,36
	j	angryfishtail3
angryfishtail3:
	beq	$t0,5,angryresettail4
	subi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail4:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,37
	j	angryfishtail4
angryfishtail4:
	beq	$t0,5,angryresettail5
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail5:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,38
	j	angryfishtail5
angryfishtail5:
	beq	$t0,4,angryresettail6
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail6:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,39
	j	angryfishtail6
angryfishtail6:
	beq	$t0,3,angryresettail7
	subi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail7:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,40
	j	angryfishtail7
angryfishtail7:
	beq	$t0,2,angryresettail8
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail8:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,41
	j	angryfishtail8
angryfishtail8:
	beq	$t0,1,angryresettail9
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail9:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,42
	j	angryfishtail9
angryfishtail9:
	beq	$t0,6,angryresettail10
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail10:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,43
	j	angryfishtail10
angryfishtail10:
	beq	$t0,1,angryresettail11
	subi	$a0,$a0,1
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail11:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,44
	j	angryfishtail11
angryfishtail11:
	beq	$t0,2,angryresettail12
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail12:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,45
	j	angryfishtail12
angryfishtail12:
	beq	$t0,2,angryresettail13
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
angryresettail13:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,46
	j	angryfishtail13
angryfishtail13:
	beq	$t0,1,moodsloop
	subi	$a1,$a1,1
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, ORANGE
	j	draw_mood3
	
####### DDRAW PIXEL FUNCTION FOR ANGRY WHALE ################
draw_mood3:
	# s1 = address = MEM + 4*(x + y*width)
	mul	$s1, $a1, WIDTH   # y * WIDTH
	add	$s1, $s1, $a0	  # add X
	mul	$s1, $s1, 4	  # multiply by 4 to get word offset
	add	$s1, $s1, MEM	  # add to base address
	sw	$a2, 0($s1)	  # store color at memory location
	
	# t6 is used to distiniguish which function to loop back to based on 
	# the number 
	beq	$t6,0, angrywhale
	beq	$t6,1,angrydown
	beq	$t6,2,angrybottom
	beq	$t6,3,angryup
	beq	$t6,4,angrytop
	beq	$t6,5, angryinside1
	beq	$t6,6, angryinside2
	beq	$t6,7, angryinside3
	beq	$t6,8, angryinside4
	beq	$t6,9, angryinside5
	beq	$t6,10, angryinside6
	beq	$t6,11, angryinside7
	beq	$t6,12, angryinside8
	beq	$t6,13, angryinside9
	beq	$t6,14, angryinside10
	beq	$t6,15, angryinside11
	beq	$t6,16, angryinside12
	beq	$t6,17, angryinside13
	beq	$t6,18, angryinside14
	beq	$t6,19, angryinside15
	beq	$t6,20, angryinside16
	beq	$t6,21, angryinside17
	beq	$t6,22, angryinside18
	beq	$t6,23, angryinside19
	beq	$t6,24, angryinside20
	beq	$t6,25, angryinside21
	beq	$t6,26, angryinside22
	beq	$t6,27, angryinside23
	beq	$t6,28, angryinside24
	beq	$t6,29, angryinside25
	beq	$t6,30, angryinside26
	beq	$t6,31, angryinside27
	beq	$t6,32, angryinside28
	beq	$t6,33, angryfisheye
	beq	$t6,34, angryfishtail1
	beq	$t6,35, angryfishtail2
	beq	$t6,36, angryfishtail3
	beq	$t6,37, angryfishtail4
	beq	$t6,38, angryfishtail5
	beq	$t6,39, angryfishtail6
	beq	$t6,40, angryfishtail7
	beq	$t6,41, angryfishtail8
	beq	$t6,42, angryfishtail9
	beq	$t6,43, angryfishtail10
	beq	$t6,44, angryfishtail11
	beq	$t6,45, angryfishtail12
	beq	$t6,46, angryfishtail13

####### NERVOUS WHALE FUNCTION ################

# turns the color of the whale to olive to indicate user is feeling nervous
setcounter4:
	li	$t2, 0
	j	nervouswhale
	
######## COLORS THE OUTER RIM OF THE WHALE ############
nervouswhale:
	li	$t6,0
	beq	$t2,1,nervousresetdown
	addi 	$a0, $0, 40    # a0 = X = WIDTH/2
	sra 	$a0, $a0, 1
	addi 	$a1, $0, 40  # a1 = Y = HEIGHT/2
	sra 	$a1, $a1, 1
	addi 	$a2, $0, OLIVE  # a2 = red (ox00RRGGBB)
	add	$t2,$t2,1
	li	$t1, 5
	jal 	draw_mood4
nervousresetdown:
	add	$t2,$zero,$zero
	li	$t6,1
	j	nervousdown
nervousdown:
	beq	$t0, 16, nervousresetbottom
	addi	$a1,$a1,1	# covers the outerrim down side of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1	# counter 
	j	draw_mood4
nervousresetbottom:
	add	$t2,$zero,$zero
	li	$t6,2
	j	nervousbottom
nervousbottom:
	beq	$t0, 35, nervousresetup
	addi	$a0,$a0,1	# covers the outterim bottom of the whale 
	addi	$t2,$t2,1	
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1	# counter 
	j	draw_mood4	
nervousresetup:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,3
	j	nervousup
nervousup:
	beq	$t0, 14, nervousresettop
	subi	$a1,$a1,1	# covers the outterim of the uo side of the whal e
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1	# counter 
	j	draw_mood4
nervousresettop:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,4
	j	nervousup
nervoustop:
	beq	$t0, 19, nervousresetinside1
	subi	$a0,$a0,1	# covers the outterim  of the top side of the whale 
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1	# counter 
	j	draw_mood4
	
##### COLORS THE INSIDE OF THE WHALE BODY #########
nervousresetinside1:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,5
	j	nervousinside1
nervousinside1:
	beq	$t0, 14, nervousresetinside2
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside2:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,6
	j	nervousinside2
nervousinside2:
	beq	$t0, 17, nervousresetinside3
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside3:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,7
	j	nervousinside3
nervousinside3:
	beq	$t0, 13, nervousresetinside4
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside4:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,8
	j	nervousinside4
nervousinside4:
	beq	$t0, 16, nervousresetinside5
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside5:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,9
	j	nervousinside5
nervousinside5:
	beq	$t0, 12, nervousresetinside6
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside6:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,10
	j	nervousinside6
nervousinside6:
	beq	$t0, 15, nervousresetinside7
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside7:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,11
	j	nervousinside7
nervousinside7:
	beq	$t0, 11, nervousresetinside8
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside8:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,12
	j	nervousinside8
nervousinside8:
	beq	$t0, 14, nervousresetinside9
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside9:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,13
	j	nervousinside9
nervousinside9:
	beq	$t0, 10, nervousresetinside10
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside10:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,14
	j	nervousinside10
nervousinside10:
	beq	$t0, 13, nervousresetinside11
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside11:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,15
	j	nervousinside11
nervousinside11:
	beq	$t0, 9, nervousresetinside12
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside12:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,16
	j	nervousinside12
nervousinside12:
	beq	$t0, 12, nervousresetinside13
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside13:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,17
	j	nervousinside13
nervousinside13:
	beq	$t0, 8, nervousresetinside14
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside14:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,18
	j	nervousinside14
nervousinside14:
	beq	$t0, 11, nervousresetinside15
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside15:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,19
	j	nervousinside15
nervousinside15:
	beq	$t0, 7, nervousresetinside16
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside16:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,20
	j	nervousinside16
nervousinside16:
	beq	$t0, 10, nervousresetinside17
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside17:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,21
	j	nervousinside17
nervousinside17:
	beq	$t0, 6, nervousresetinside18
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside18:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,22
	j	nervousinside18
nervousinside18:
	beq	$t0, 9, nervousresetinside19
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside19:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,23
	j	nervousinside19
nervousinside19:
	beq	$t0, 5, nervousresetinside20
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside20:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,24
	j	nervousinside20
nervousinside20:
	beq	$t0, 8, nervousresetinside21
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside21:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,25
	j	 nervousinside21
nervousinside21:
	beq	$t0, 4, nervousresetinside22
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside22:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,26
	j	nervousinside22
nervousinside22:
	beq	$t0, 7, nervousresetinside23
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside23:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,27
	j	nervousinside23
nervousinside23:
	beq	$t0, 3, nervousresetinside24
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside24:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,28
	j	nervousinside24
nervousinside24:
	beq	$t0, 6, nervousresetinside25
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside25:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,29
	j	nervousinside25
nervousinside25:
	beq	$t0, 2, nervousresetinside26
	addi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside26:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,30
	j	nervousinside26
nervousinside26:
	beq	$t0, 5, nervousresetinside27
	addi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside27:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,31
	j	nervousinside27
nervousinside27:
	beq	$t0, 1, nervousresetinside28
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresetinside28:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,32
	j	nervousinside28
nervousinside28:
	beq	$t0, 4, nervousfisheyereset
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
	
##### DRAWS THE NERVOUS WHALE EYE ##########
nervousfisheyereset:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,33
	j	nervousfisheye
nervousfisheye:
	beq	$t0, 1, nervousresettail1
	subi	$a0,$a0,1
	addi	$t2,$t2,1
	addi	$a2, $0, BLACK
	addi	$t0,$t0,1
	j	draw_mood4

##### NEVERVOUS FISH TAIL FUNCTION ########## 
nervousresettail1:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,34
	addi	$a0,$a0,11
	addi	$a1,$a1,2
	j	nervousfishtail1
nervousfishtail1:
	beq	$t0,7,nervousresettail2
	addi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	addi	$t0,$t0,1
	j	draw_mood4
nervousresettail2:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,35
	j	nervousfishtail2
nervousfishtail2:
	beq	$t0,11,nervousresettail3
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail3:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,36
	j	nervousfishtail3
nervousfishtail3:
	beq	$t0,5,nervousresettail4
	subi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail4:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,37
	j	nervousfishtail4
nervousfishtail4:
	beq	$t0,5,nervousresettail5
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail5:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,38
	j	nervousfishtail5
nervousfishtail5:
	beq	$t0,4,nervousresettail6
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail6:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,39
	j	nervousfishtail6
nervousfishtail6:
	beq	$t0,3,nervousresettail7
	subi	$a0,$a0,1
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail7:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,40
	j	nervousfishtail7
nervousfishtail7:
	beq	$t0,2,nervousresettail8
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail8:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,41
	j	nervousfishtail8
nervousfishtail8:
	beq	$t0,1,nervousresettail9
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail9:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,42
	j	nervousfishtail9
nervousfishtail9:
	beq	$t0,6,nervousresettail10
	subi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail10:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,43
	j	nervousfishtail10
nervousfishtail10:
	beq	$t0,1,nervousresettail11
	subi	$a0,$a0,1
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail11:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,44
	j	nervousfishtail11
nervousfishtail11:
	beq	$t0,2,nervousresettail12
	addi	$a1,$a1,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail12:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,45
	j	nervousfishtail12
nervousfishtail12:
	beq	$t0,2,nervousresettail13
	subi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
nervousresettail13:
	add	$t2,$zero,$zero
	add	$t0, $zero,$zero
	li	$t6,46
	j	nervousfishtail13
nervousfishtail13:
	beq	$t0,1,moodsloop
	subi	$a1,$a1,1
	addi	$a0,$a0,1
	addi	$t0,$t0,1
	addi	$t2,$t2,1
	addi	$a2,$0, OLIVE
	j	draw_mood4
	
######## DRAW PIXEL FUNCTION FOR NERVOUS WHALE #############
draw_mood4:
	# s1 = address = MEM + 4*(x + y*width)
	mul	$s1, $a1, WIDTH   	# y * WIDTH
	add	$s1, $s1, $a0	 	# add X
	mul	$s1, $s1, 4	  	# multiply by 4 to get word offset
	add	$s1, $s1, MEM	  	# add to base address
	sw	$a2, 0($s1)	 	# store color at memory location
	
	# t6 is used to distiniguish which function to loop back to based on 
	# the number 
	beq	$t6,0, nervouswhale
	beq	$t6,1,nervousdown
	beq	$t6,2,nervousbottom
	beq	$t6,3,nervousup
	beq	$t6,4,nervoustop
	beq	$t6,5, nervousinside1
	beq	$t6,6, nervousinside2
	beq	$t6,7, nervousinside3
	beq	$t6,8, nervousinside4
	beq	$t6,9, nervousinside5
	beq	$t6,10, nervousinside6
	beq	$t6,11, nervousinside7
	beq	$t6,12, nervousinside8
	beq	$t6,13, nervousinside9
	beq	$t6,14, nervousinside10
	beq	$t6,15, nervousinside11
	beq	$t6,16, nervousinside12
	beq	$t6,17, nervousinside13
	beq	$t6,18, nervousinside14
	beq	$t6,19, nervousinside15
	beq	$t6,20, nervousinside16
	beq	$t6,21, nervousinside17
	beq	$t6,22, nervousinside18
	beq	$t6,23, nervousinside19
	beq	$t6,24, nervousinside20
	beq	$t6,25, nervousinside21
	beq	$t6,26, nervousinside22
	beq	$t6,27, nervousinside23
	beq	$t6,28, nervousinside24
	beq	$t6,29, nervousinside25
	beq	$t6,30, nervousinside26
	beq	$t6,31, nervousinside27
	beq	$t6,32, nervousinside28
	beq	$t6,33, nervousfisheye
	beq	$t6,34, nervousfishtail1
	beq	$t6,35, nervousfishtail2
	beq	$t6,36, nervousfishtail3
	beq	$t6,37, nervousfishtail4
	beq	$t6,38, nervousfishtail5
	beq	$t6,39, nervousfishtail6
	beq	$t6,40, nervousfishtail7
	beq	$t6,41, nervousfishtail8
	beq	$t6,42, nervousfishtail9
	beq	$t6,43, nervousfishtail10
	beq	$t6,44, nervousfishtail11
	beq	$t6,45, nervousfishtail12
	beq	$t6,46, nervousfishtail13
	jr	$ra
	
####### EXIT PROGRAM ##########
exit:
	li	$v0, 10
	syscall
