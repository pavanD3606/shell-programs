#!/bin/bash

calculate_battery_life() {
  capacity=$1
  current=$2
  runtime=$(echo "$capacity / $current" | bc -l)
  echo "Battery life is approximately $runtime hours"
}

echo "Enter battery capacity in Amp-hours (Ah):"
read capacity

echo "Enter load current in Amps (A):"
read current

echo "Enter battery voltage in Volts (V):"
read voltage

calculate_battery_life $capacity $current

