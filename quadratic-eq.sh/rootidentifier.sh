#!/bin/bash

# Generate a random quadratic equation: ax² + bx + c = 0

# Random numbers for a, b, and c
a=$((RANDOM % 9 + 1))     # 1 to 9 (a ≠ 0)
b=$((RANDOM % 21 - 10))   # -10 to 10
c=$((RANDOM % 21 - 10))   # -10 to 10

# Display the equation
echo "🧪 Generated Quadratic Equation:"
echo "${a}x² $([[ $b -ge 0 ]] && echo "+ $b" || echo "- $((-1 * b))")x $([[ $c -ge 0 ]] && echo "+ $c" || echo "- $((-1 * c))") = 0"

