#!/bin/bash

multiply() {
    local result=$(( $1 * $2 * $3 ))
    echo "$1 * $2 * $3 = $result"
}

if [ $# -eq 3 ]; then
    multiply $1 $2 $3
else
    read -p "Enter first number: " num1
    read -p "Enter second number: " num2
    read -p "Enter third number: " num3
    multiply $num1 $num2 $num3
fi
