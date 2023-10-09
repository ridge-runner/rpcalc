#!/bin/bash

# RPCALC - Reverse Polish Notation Calculator
# Written by Brett Vandyke

# Description: A four-function calculator that runs on BASh CLI that accepts opperands and operators in reverse order.
# For example: 2 + 2 would be entered as: 2 2 +. The operators available include +, -, *, /. The program only accepts # integers. Division operations that return a remainder have special notation. The R prefix is used to denote
# remainders. For example, 7/2 = 3R1.

# Check the number of arguments passed through CLI
if [ "$#" -ne 3 ]; then
	echo "-- RP CALC --- "
	echo "Usage: $0 operand1 operand2 operator"
	echo "Permitted Operations: +, -, *, /"
	echo "Only integers accepted and returned. Remainders noted with R prefix."
	echo "Multiply operators have to be quoted to function like so: '*'. If the * is not " 
	echo "escaped, the CLI will interperet it as a wildcard character causing an "
	echo "undefined operator error or help message."
	exit 1
fi

# $0 is the script name so it is not included.
operand1="$1"
operand2="$2"
operator="$3"

# Verify that operands are integers.
# ^ = start of line. -? = matches one negative sign or positive sign. [0-9] char class.
# + = one or more of preceeding element. $ = asserts end of line
# The regex matches integers, all other data types trigger a type error.

if ! [[ "$operand1" =~ ^-?[0-9]+$ ]] || ! [[ "$operand2" =~ ^-?[0-9]+$ ]]; then
	echo "Error: Invalid type: Both operands should be integers."
	exit 1
fi

case "$operator" in
	'+')
		echo "$(( operand1 + operand2 ))"
		;;
	'-')
		echo "$(( operand1 - operand2 ))"
		;;
	'*')
		echo "$(( operand1 * operand2 ))"
		;;
	'/')
		if [ "$operand2" -eq 0 ]; then
			echo "Error: Division by zero."
			exit 1
		else
			quotient=$(( operand1 / operand2 ))
			remainder=$(( operand1 % operand2 ))
			echo "${quotient}R${remainder}"
		fi
		;;
	*)
		echo "Error: Invalid operator. Please used one of the following: + - * /"
		exit 1
		;;
esac

