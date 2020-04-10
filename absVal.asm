# Calculate the absolute value of A
#
# Registers:
# $8	A, two's comp. integer
# $9	sign bit of A
# $10	base register for .data section

	.text
	.globl main
	
main:
	# Get A
	lui		$10, 0x1000			# Init base register
	lw		$8, 0($10)			# Load A
	sll		$0, $0, 0			# no-op
	
	# Is A Negative?
	srl		$9, $8, 31			# Shift sign bit to position 0
	beq		$0, $9, done		# sign bit == zero, done. A is positive!
	sll		$0, $0, 0			# no-op
	
	# Store -A
	subu	$8, $0, $8			# negate A by subtracting it from 0
	sw		$8, 0($10)			# save it in memory
	
done:
	sll 	$0, $0, 0
	
	.data
A:	.word	-1