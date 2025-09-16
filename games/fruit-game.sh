#!/bin/bash

words=("apple" "banana" "orange" "grapes" "lemon" "mango")
secret_word=${words[$RANDOM % ${#words[@]}]}
max_attempts=6
guessed_letters=""
correct_guess="_"
tries=0

# Initialize display word
for ((i=0; i<${#secret_word}; i++)); do
    display_word+="_"
done

echo "🔤 Welcome to the Secret Word Game!"
echo "Guess the letters of the secret fruit word. You have $max_attempts tries."
echo

while [[ $tries -lt $max_attempts && "$display_word" != "$secret_word" ]]; do
    echo "Word: $display_word"
    echo "Guessed Letters: $guessed_letters"
    read -p "Enter a letter: " letter

    # Check for valid input
    if [[ ! $letter =~ ^[a-zA-Z]$ ]]; then
        echo "❌ Please enter a single letter only!"
        continue
    fi

    letter=${letter,,}  # convert to lowercase

    if [[ $guessed_letters == *"$letter"* ]]; then
        echo "⚠️ You already guessed '$letter'. Try another."
        continue
    fi

    guessed_letters+="$letter"

    if [[ $secret_word == *"$letter"* ]]; then
        echo "✅ Good guess!"
        # Reveal the letter in the display word
        for ((i=0; i<${#secret_word}; i++)); do
            if [[ "${secret_word:$i:1}" == "$letter" ]]; then
                display_word="${display_word:0:$i}$letter${display_word:$((i+1))}"
            fi
        done
    else
        echo "❌ Wrong guess!"
        ((tries++))
    fi
    echo
done

# End of game
if [[ "$display_word" == "$secret_word" ]]; then
    echo "🎉 You won! The word was: $secret_word"
else
    echo "💀 You lost! The word was: $secret_word"
fi
