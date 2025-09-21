#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <radius> <angle_in_degrees>"
    exit 1
fi

r=$1
theta_deg=$2
theta_rad=$(echo "scale=10; $theta_deg * (a(1) * 4) / 180" | bc -l)
x=$(echo "scale=6; $r * c($theta_rad)" | bc -l)
y=$(echo "scale=6; $r * s($theta_rad)" | bc -l)

echo "Rectangular coordinates:"
echo "x = $x"
echo "y = $y"

