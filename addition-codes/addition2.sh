#!/bin/bash

# Ask user for the first number
echo "Enter the first number:"
read num1

# Ask user for the second number
echo "Enter the second number:"
read num2

# Ask user for the third number
echo "Enter the third number:"
read num3

# Perform addition
sum=$((num1 + num2 + num3))

# Display the result
echo "The sum is: $sum"

