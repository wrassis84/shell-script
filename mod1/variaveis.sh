#!/usr/bin/env bash 

# When using variable values with spaces and line brakes...
NAME="William Ramos
de Assis Rezende"

# We must use double quoted to read or show the variable values.
# This will preserve the variable formatting!
echo "$NAME"

NUMBER_1="24"
NUMBER_2="90"

TOTAL=$(($NUMBER_1+$NUMBER_2))

echo "$TOTAL"
