.syntax unified
.thumb

.global main


.data
@ define variables
byte_array: .byte 0, 1, 2, 3, 4, 5, 6

.text
@ define code



@ this is the entry function called from the startup file
@ it replaces the c main function that was removed when we made
@ this project
main:

	LDR R0, =0x1234
	LDR R1, =0x0001

	LDR R2, =byte_array
	LDR R4, =0x00

	ADD R0, R1

forever_loop:

	LDRB R3, [R2, R4] @ loads a single byte from byte_array (offset R4) into R3
	ADD R3, #0x01
	STRB R3, [R2, R4] @ stores the incremented byte back into byte_array at the same position.

	ADD R4, 0x01

	@ questions - what happens when we go past the end of the array?
	@  	        - what happens in c?

	@ change the value of the addition

	@ change the LDRB to LDRH (same for STR) -  what does this mean
	@ 	make sure to change the increment pointer - what happens otherwise


	B forever_loop
