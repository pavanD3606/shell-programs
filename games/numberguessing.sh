#!/bin/bash

# Generate a random number between 1 and 100
target=$((RANDOM % 100 + 1))
attempts=0

echo "🎯 Guess the number (between 1 and 100)"

while true; do
    read -p "Enter your guess: " guess
    ((attempts++))
    
    if [[ $guess -lt $target ]]; then
        echo "Too low! 📉"
    elif [[ $guess -gt $target ]]; then
        echo "Too high! 📈"
    else
        echo "🎉 Correct! You guessed it in $attempts tries."
        break
    fi
done

