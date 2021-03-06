# Check that 30 <= temp <= 55
# Set flag to 1 if in range, to 0 if out of range
#
# Registers:
# $2	temperature
# $3	in/out range indicator flag
# $8	scratch

	.text
	.globl main

main:
	# Set range indicator to 1
	ori		$3, $0, 1
	
	# Test 30 <= temp <= 55
	sltiu	$8, $2, 56			# $8 = 1 if temp <= 55
	beq		$8, $0, out			# 0? out of range
	sll		$0, $0, 0			# no-op
	
	sltiu	$8, $2, 30			# $8 = 1 if temp < 30
	beq		$8, $0, cont		# 0? in range
	sll 	$0, $0, 0			# no-op
	
out:
	# Out of Range: clear range indicator to 0
	ori		$3, $0, 0
	
cont:
	sll		$0, $0, 0			# target for the jump