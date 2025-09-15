#!/bin/bash

echo Enter number of poles \(P\):
read poles

echo Enter supply frequency in Hz \(f\):
read frequency

echo Enter rotor speed in RPM \(Nr\):
read rotor_speed

synchronous_speed=$((120 * frequency / poles))

expression="scale=2; (($synchronous_speed - $rotor_speed) / $synchronous_speed) * 100"
slip=$(echo $expression | bc)

echo --------follow the results--------
echo Synchronous Speed \(Ns\): $synchronous_speed RPM
echo Rotor Speed \(Nr\):       $rotor_speed RPM
echo Slip:                     $slip %
echo -----code excute done-------
 
