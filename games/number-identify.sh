#!/bin/bash

# Simple Math Quiz Game in Bash

score=0
rounds=5

echo "🧠 Welcome to the Math Quiz Game!"
echo "You will get $rounds math problems. Try to answer correctly!"
echo

for ((i=1; i<=rounds; i++)); do
    num1=$((RANDOM % 20 + 1))
    num2=$((RANDOM % 20 + 1))
    op=$((RANDOM % 3))

    case $op in
        0) symbol="+"; answer=$((num1 + num2));;
        1) symbol="-"; answer=$((num1 - num2));;
        2) symbol="*"; answer=$((num1 * num2));;
    esac

    echo "🔢 Question $i: What is $num1 $symbol $num2?"
    read -p "Your answer: " user_answer

    if [[ "$user_answer" -eq "$answer" ]]; then
        echo "✅ Correct!"
        ((score++))
    else
        echo "❌ Incorrect! The correct answer was $answer."
    fi
    echo
done

echo "🏁 Game over! You got $score out of $rounds correct."

if [[ "$score" -eq "$rounds" ]]; then
    echo "🎉 Perfect score! You're a math genius!"
elif [[ "$score" -ge $((rounds / 2)) ]]; then
    echo "👍 Nice job!"
else
    echo "💡 Keep practicing!"
fi

