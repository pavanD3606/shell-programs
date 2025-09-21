#!/bin/bash

stty -echo -icanon time 0 min 0
tput civis

cols=$(tput cols)
rows=$(tput lines)
cols=$((cols - 1))
rows=$((rows - 1))

x=10
y=10
dx=1
dy=0
length=5
score=0
tailx=()
taily=()

draw() {
    clear
    echo "Score: $score"
    tput cup $y $x
    echo -n "O"
    for ((i=0;i<${#tailx[@]};i++)); do
        tput cup ${taily[i]} ${tailx[i]}
        echo -n "o"
    done
    tput cup $foody $foodx
    echo -n "+"
    tput cup $rows 0
}

move() {
    tailx=("${x}" "${tailx[@]}")
    taily=("${y}" "${taily[@]}")
    if (( ${#tailx[@]} > length )); then
        unset 'tailx[-1]'
        unset 'taily[-1]'
    fi
    x=$((x + dx))
    y=$((y + dy))
    if ((x < 0 || x >= cols || y < 1 || y >= rows)); then
        gameover
    fi
    for ((i=0;i<${#tailx[@]};i++)); do
        if ((x == tailx[i] && y == taily[i])); then
            gameover
        fi
    done
    if ((x == foodx && y == foody)); then
        length=$((length + 1))
        score=$((score + 10))
        place_food
    fi
}

gameover() {
    tput cnorm
    stty echo icanon
    clear
    echo "Game Over! Score: $score"
    exit
}

place_food() {
    foodx=$((RANDOM % cols))
    foody=$(( (RANDOM % (rows - 1)) + 1 ))
}

read_input() {
    read -s -n 1 key
    case "$key" in
        w) dx=0; dy=-1 ;;
        s) dx=0; dy=1 ;;
        a) dx=-1; dy=0 ;;
        d) dx=1; dy=0 ;;
        q) gameover ;;
    esac
}

place_food

while true; do
    read_input
    move
    draw
    sleep 0.1
done

