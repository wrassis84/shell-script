#!/usr/bin/env bash 

# When using variable values with spaces and line brakes...
NAME="William Ramos
de Assis Rezende"

# We must use double quoted to read or show the variable values.
# This will preserve the variable formatting!
echo "$NAME"

NUMBER_1="24"
NUMBER_2="90"

# For arithmetic operations, we must use dollar sign followed by double
# parentheses:
TOTAL=$(($NUMBER_1+$NUMBER_2))

echo "$TOTAL"

# We can assign the output of commands  for variables.
# For command outputs we can use a dollar sign followed by parentheses.
CAT_OUTPUT="$(cat /etc/passwd | grep william)"

echo "$CAT_OUTPUT"
