################################################################################
#
#!/usr/bin/env bash
#
################################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# Message.sh - This program tests config files.
#
# Site      : https://github.com/wrassis84/shell-script
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
################################################################################
### DESCRIPTION ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will echo a message colored or not, uppercase or not. The options
# will be passed by a config file.
#
# Usage:
# ./Message.sh
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.0 15/12/2022, William Ramos de Assis Rezende:
#  - Program's first version;
#
################################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################################
### VARIABLE DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
CONFIG_FILE="Options.conf"
UPPERCASE=
COLORS=

GREEN="\033[32;1m"  #|
YELLOW="\033[33;1m" #|
RED="\033[31;1m"    #| Colors for output:
PURPLE="\033[35;1m" #|
CIAN="\033[36;1m"   #|

MESSAGE="
        Theory and practice sometimes clash. And when that happens,
        theory loses. Every single time.
                                                    - Linus Torvalds

        https://www.goodreads.com/author/quotes/92867.Linus_Torvalds
"
VERSION="v1.0" # Program's version
#
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
[ ! -r "$CONFIG_FILE" ] \
                     && echo -n "No read permission on "$CONFIG_FILE" file!\n" \
                     && echo -n "[ENTER] to continue:" && read REPLY && clear  \
                     && exit 1
#
################################################################################
### FUNCTION DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#   The "debug_func" function below displays debug messages according to desired
#   debug level.
#   To use it, just place it on the desired line with the debug level as an
#   argument and the "DEBUG MESSAGE" between double quotes. We can use the
#   following levels:
#   1 - generic messages          (location, eg: START/END of the program);
#   2 - flow location messages    (eg entering/leaving WHILE);
#   3 - content of important vars (e.g. $VAR's value before/after incrementing)
#
debug_func() {
    [ $1 -le $DEBUG_LEVEL ] && echo -e "${2}Debug $* -----"
}

sum_func() {
  local total=0

  for i in $(seq 1 25); do
    # Debug level 1
    debug_func 1 ${GREEN}  "Entering FOR with value: $i" 
    total=$(($total+$i))
    # Debug level 2
    debug_func 2 ${YELLOW} "After sum: $total"
  done
  #echo $total
}
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
while read -r line
do
  [ "$(echo $line | cut -c1)" = "#" ] && continue
  echo "$line"
done < "$CONFIG_FILE"

#echo "$MESSAGE"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
### TODO: Add RED color to error messages.
################################################################################
