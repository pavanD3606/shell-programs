#!/bin/bash

# Basic Quadratic Equation Solver: ax^2 + bx + c = 0

echo "📘 Solving: ax² + bx + c = 0"
read -p "Enter a: " a
read -p "Enter b: " b
read -p "Enter c: " c

# Check if 'a' is 0
if [ "$a" -eq 0 ]; then
    echo "❌ 'a' cannot be zero. Not a quadratic equation."
    exit 1
fi

# Calculate discriminant: d = b^2 - 4ac
d=$(echo "$b * $b - 4 * $a * $c" | bc)

# If d < 0, no real roots
if [ "$d" -lt 0 ]; then
    echo "❌ No real solutions (discriminant is negative)."
    exit 0
fi

# Calculate square root of discriminant
sqrt_d=$(echo "scale=4; sqrt($d)" | bc -l)

# Calculate two roots
x1=$(echo "scale=4; (-1 * $b + $sqrt_d) / (2 * $a)" | bc -l)
x2=$(echo "scale=4; (-1 * $b - $sqrt_d) / (2 * $a)" | bc -l)

# Show results
echo "✅ Roots:"
echo "x₁ = $x1"
echo "x₂ = $x2"
