#!/bin/bash

read Ra
read Rb
read Rc

Rab=$(echo "scale=6; ($Ra*$Rb + $Rb*$Rc + $Rc*$Ra)/$Rc" | bc -l)
Rbc=$(echo "scale=6; ($Ra*$Rb + $Rb*$Rc + $Rc*$Ra)/$Ra" | bc -l)
Rca=$(echo "scale=6; ($Ra*$Rb + $Rb*$Rc + $Rc*$Ra)/$Rb" | bc -l)

echo "$Rab"
echo "$Rbc"
echo "$Rca"

