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

echo ""

echo "---------------------------------------------"

echo ""

echo "Name of this program: $0"
echo "Parameter 1: $1"
echo "Parameter 2: $2"
echo "Parameter 3: $3"
echo "Total of parameteres: $#"
echo "All parameteres: $*"
echo "All parameteres: $@"
echo "PID of this program: $$"
echo "PID of latest job in background: $!"
echo "Latest parameter of latest run command: $_"
echo "Latest command return code: $?"
