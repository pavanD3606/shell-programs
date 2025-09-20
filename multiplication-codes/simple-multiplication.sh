#!/bin/bash

multiply() {
    local result=$(( $1 * $2 ))
    echo "$1 * $2 = $result"
}

if [ $# -eq 2 ]; then
    multiply $1 $2
else
    read -p "Enter first number: " num1
    read -p "Enter second number: " num2
    multiply $num1 $num2
fi

