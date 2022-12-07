#!/usr/bin/env bash
#
################################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# ShellDebug.sh - This program tests debugging levels.
#
# Site      : https://github.com/wrassis84/shell-script
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
################################################################################
### DESCRIPTION ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will list system users and output shall can be
# manipulated of many ways.
#
# Usage:
# ./ShellDebug.sh -d 1
# In this example, we will run the program in debug level 1.
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.2 07/12/2022, William Ramos de Assis Rezende:
#  - Added custom debug function that shows debug messages colored according
#    to chosen debug level.
# v1.1 06/12/2022, William Ramos de Assis Rezende:
#  - Program's first version;
#  - Added "-v" option for program's version;
#  - Added "-h" option for program's help;
# v1.0 05/12/2022, William Ramos de Assis Rezende:
#  - Program's first version;
#  - Added "-d" option for debug level;
#
################################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################################
### VARIABLE DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
DEBUG=0
DEBUG_LEVEL=0
USAGE_MESSAGE="
  Help Menu for $(basename $0) Program:
  [OPTIONS]:
   -h - Show this help.
   -v - Show program version.
   -d - Choose debug level. We have "1" and "2" levels.
   NOTE: Debug level must be like this:
   ./ShellDebug.sh -d 1
   ./ShellDebug.sh -d 2
"
# The debug level will passed by "$1": ./Colors.sh -d 1
DEBUG_LEVEL=${1:-0}
# Colors for debug messages according level:
GREEN="\033[32;1m"  # Level 1
YELLOW="\033[33;1m" # Level 2
RED="\033[31;1m"    # Level 3
PURPLE="\033[35;1m"
CIAN="\033[36;1m"

VERSION="v1.2"
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
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
case "$1" in
    -d) [ $2 ] && DEBUG_LEVEL=$2  ;;
    -v) echo "$VERSION" && exit 0 ;;
    -h) echo "$USAGE_MESSAGE"     ;;
     *) sum_func                  ;;
esac

sum_func
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
