#!/bin/bash

echo "Enter 3-Phase Line Voltage (V): "
read V_line

echo "Enter Line Current (A): "
read I_line

echo "Enter Supply Frequency (Hz): "
read f

echo "Enter Initial Power Factor (0 to 1): "
read pf_initial

pi=3.141592653589793

P_watt=$(echo "scale=6; sqrt(3) * $V_line * $I_line * $pf_initial" | bc -l)
S_va=$(echo "scale=6; sqrt(3) * $V_line * $I_line" | bc -l)
Q_var=$(echo "scale=6; sqrt($S_va^2 - $P_watt^2)" | bc -l)
Qc=$Q_var
V_phase=$(echo "scale=6; $V_line / sqrt(3)" | bc -l)
C=$(echo "scale=12; $Qc / (3 * 2 * $pi * $f * ($V_phase^2))" | bc -l)
C_uF=$(echo "scale=6; $C * 1000000" | bc -l)
P_kW=$(echo "scale=3; $P_watt / 1000" | bc -l)
Q_kVAR=$(echo "scale=3; $Q_var / 1000" | bc -l)

echo ""
echo "========= RESULTS ========="
echo "Active Power P (kW): $P_kW"
echo "Initial Reactive Power Q (kVAR): $Q_kVAR"
echo "Required Capacitive Qc (kVAR): $Q_kVAR"
echo "Required Capacitance per phase (Y) in Farads: $C"
echo "Required Capacitance per phase in microfarads (uF): $C_uF"
echo "===Reactive power compensation calculation is done===="

