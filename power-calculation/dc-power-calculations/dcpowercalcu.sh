#!/bin/bash

calculate_power() {
  V=$1
  I=$2
  P=$(echo "$V * $I" | bc -l)
  echo "Power (P) = $P Watts"
}

calculate_current() {
  V=$1
  R=$2
  I=$(echo "$V / $R" | bc -l)
  echo "Current (I) = $I Amps"
}

calculate_voltage() {
  I=$1
  R=$2
  V=$(echo "$I * $R" | bc -l)
  echo "Voltage (V) = $V Volts"
}

calculate_resistance() {
  V=$1
  I=$2
  R=$(echo "$V / $I" | bc -l)
  echo "Resistance (R) = $R Ohms"
}

echo "Choose the calculation you want to perform:"
echo "1. Calculate Power"
echo "2. Calculate Current"
echo "3. Calculate Voltage"
echo "4. Calculate Resistance"
read choice

case $choice in
  1)
    echo "Enter voltage (V) in Volts:"
    read voltage
    echo "Enter current (I) in Amps:"
    read current
    calculate_power $voltage $current
    ;;
  2)
    echo "Enter voltage (V) in Volts:"
    read voltage
    echo "Enter load resistance (R) in Ohms:"
    read resistance
    calculate_current $voltage $resistance
    ;;
  3)
    echo "Enter current (I) in Amps:"
    read current
    echo "Enter load resistance (R) in Ohms:"
    read resistance
    calculate_voltage $current $resistance
    ;;
  4)
    echo "Enter voltage (V) in Volts:"
    read voltage
    echo "Enter current (I) in Amps:"
    read current
    calculate_resistance $voltage $current
    ;;
  *)
    echo "Invalid choice. Please select a valid option (1-4)."
    ;;
esac

