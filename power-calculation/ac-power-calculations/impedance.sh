#!/bin/bash

read R
read X

Z=$(echo "scale=4; sqrt($R^2 + $X^2)" | bc -l)
angle=$(echo "scale=4; a=atan2($X,$R); a*180/4*a(1)" | bc -l)

echo "Resistance: $R"
echo "Reactance: $X"
echo "Impedance: $Z"
echo "Phase Angle: $angle"
