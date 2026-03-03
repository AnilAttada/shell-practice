#!/bin/bash

TIMESTAMP=$(date)
Number1=$1
Number2=$2

SUM=$(($Number1+$Number2))

echo " Sum of $Number1+$Number2 is : $SUM"

echo "Script executed at : $TIMESTAMP"

