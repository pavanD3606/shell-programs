#!/bin/bash

calculate_power() {
  V=$1
  I=$2
  pf=$3

  P=$(echo "$V * $I * $pf" | bc -l)
  S=$(echo "$V * $I" | bc -l)
  Q=$(echo "sqrt($S^2 - $P^2)" | bc -l)
  phi_rad=$(echo "a(1/$pf)" | bc -l)   # Phase angle in radians
  phi_deg=$(echo "$phi_rad * 180 / 3.141592653589793" | bc -l)  # Convert to degrees

  echo "Active Power (P) = $P Watts"
  echo "Apparent Power (S) = $S VA"
  echo "Reactive Power (Q) = $Q VAR"
  echo "Phase Angle (φ) = $phi_deg degrees"
}

echo "Enter load voltage (V) in Volts:"
read voltage

echo "Enter load current (I) in Amps:"
read current

echo "Enter load power factor (pf) (between 0 and 1):"
read pf

calculate_power $voltage $current $pf

