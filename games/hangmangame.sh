#!/bin/bash


choices=("rock" "paper" "scissors")


computer_choice() {
    echo ${choices[$((RANDOM % 3))]}
}


echo "Enter rock, paper, or scissors:"
read user_choice


comp_choice=$(computer_choice)

echo "Computer chose: $comp_choice"
echo "You chose: $user_choice"


if [[ $user_choice == $comp_choice ]]; then
    echo "It's a tie!"
elif [[ ($user_choice == "rock" && $comp_choice == "scissors") || 
        ($user_choice == "scissors" && $comp_choice == "paper") || 
        ($user_choice == "paper" && $comp_choice == "rock") ]]; then
    echo "You win!"
else
    echo "Computer wins!"
fi

