#!/bin/bash

GREETINGS="Hello, This is from script-1"
echo "$GREETINGS"

echo "PID of script-1 : $$"

./script-2.sh

source ./script-2.sh