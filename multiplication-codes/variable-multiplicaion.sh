#!/bin/bash

if [ $# -eq 3 ]; then
    num1=$1
    num2=$2
    num3=$3
else
    read -p "Enter first number: " num1
    read -p "Enter second number: " num2
    read -p "Enter third number: " num3
fi

result=$(( num1 * num2 * num3 ))
echo "$num1 * $num2 * $num3 = $result"
 
