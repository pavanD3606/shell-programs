#!/bin/bash

# Quadratic Equation Solver in Bash

echo "🧠 Quadratic Equation Solver"
echo "Equation format: ax² + bx + c = 0"
echo

# Input coefficients
read -p "Enter coefficient a: " a
read -p "Enter coefficient b: " b
read -p "Enter coefficient c: " c

# Prevent division by zero
if [ "$a" -eq 0 ]; then
    echo "❌ 'a' cannot be zero in a quadratic equation."
    exit 1
fi

# Calculate discriminant
d=$((b * b - 4 * a * c))

echo
echo "📊 Discriminant (b² - 4ac) = $d"

if [ "$d" -lt 0 ]; then
    echo "❌ No real roots. Discriminant is negative."
    exit 0
fi

# Calculate roots using bc for floating point math
sqrt_d=$(echo "scale=5; sqrt($d)" | bc)
denom=$(echo "2 * $a" | bc)
x1=$(echo "scale=5; (-1 * $b + $sqrt_d) / $denom" | bc)
x2=$(echo "scale=5; (-1 * $b - $sqrt_d) / $denom" | bc)

echo
echo "✅ Roots of the equation:"
echo "x₁ = $x1"
echo "x₂ = $x2"

