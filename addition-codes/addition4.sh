#!/bin/sh
read -p "Enter how many numbers to add: " count
sum=0
i=0
while [ $i -lt $count ]; do
  read -p "Enter number $((i+1)): " num
  sum=$((sum + num))
  i=$((i + 1))
done
echo "$sum"

