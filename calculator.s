# 
# Filename: calculator.see
#
# Purpose: contains functions for addition, subtraction, and multiplication, as well as clear
#
# Authors: AL + Linus Pui
#

	.globl	clear # Make sure you change the name of this function - see XX function below
	.globl	plus
	.globl	minus
	.globl	mul


clear: # Description: 
    # Change the name of this function to something more descriptive and add a description above
	xorl	%eax, %eax	# clears register
	cmpl	%esi, %edi
	setl	%al         # See Section 3.6.2 of our textbook for a  
	ret                 # description of the set* instruction family

plus: # Description: Performs integer addition
# Requirement:
# - you cannot use add* instruction
# - you cannot use a loop

# Put your code here
	movl	%edi, %eax	# move x into ret register
	movl	%esi, %edx	# move y into %ebx
	neg		%edx		# negate y to get -you
	subl	%edx, %eax	# perform x = x - (-y) and stores into %eax
	ret					# returns %eax


minus: # Description: Performs integer subtraction
# Requirement:
# - you cannot use sub* instruction
# - you cannot use a loop

# Put your code here
	movl	%edi, %eax	# move x into ret register
	movl	%esi, %edx	# move y into %edx
	neg		%edx		# flip sign of you
	addl	%edx, %eax	# perform x = x + (-y)
	ret					# returns %eax


mul: # Description: Performs integer multiplication - when both operands are non-negative!
# You can assume that both operands are non-negative.
# Requirements:
# - you cannot use imul* instruction 
#   (or any kind of instruction that multiplies such as mul)
# - you must use a loop
	movl	$0, %eax	# load 0 into result
	movl	$0, %ebx	# load 0 into counter 
	jmp		cond

loop:
	addl	%edi, %eax	# add x to result
	addl	$1, %ebx	# add 1 to counter

cond:
	compl	%ebx, %esi	# if %ebx (counter) is less than y (number of times to add)
	jae		loop		# jump to loop
	ret

# algorithm:
# result = 0;
# counter = 0;
# for (counter < y) {
#	result += n;
# }