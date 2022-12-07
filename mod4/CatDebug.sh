#!/usr/bin/env bash
#
################################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# CatDebug.sh - This program tests debugging levels.
#
# Site      : https://github.com/wrassis84/shell-script
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
################################################################################
### DESCRIPTION ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will work with debug samples.
#
# Usage:
# ./CatDebug.sh 1
# In this example, we will run the program in debug level 1.
# We can chose from  "1" to "3" levels:
# ./CatDebug.sh 1 OR ./CatDebug.sh 2 OR ./CatDebug.sh 3
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.2 07/12/2022, William Ramos de Assis Rezende:
#   - Added colors on debug messages according to debug level;;
# v1.1 07/12/2022, William Ramos de Assis Rezende:
#   - Added color on debug messages;
# v1.0 06/12/2022, William Ramos de Assis Rezende:
#   - Program's first version;
#   - Added "-d" option for debug level;
#
################################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################################
### VARIABLE DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
DEBUG_LEVEL=${1:-0}     # The debug level will passed by "$1": ./CatDebug.sh 1
INI=0
MAX=10
GREEN="\033[32;1m"
YELLOW="\033[33;1m"
RED="\033[31;1m"
ESC="\033[m"
VERSION="v1.2"
#
################################################################################
### FUNCTION DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
debug_func() {
  [ $1 -le $DEBUG_LEVEL ] || return 
  local pref suf
  case "$1" in
    1) pref="| " && suf=" |" && echo -e  "${GREEN}$pref$*$suf${ESC}";; 
    2) pref="| " && suf=" |" && echo -e "${YELLOW}$pref$*$suf${ESC}";;
    3) pref="| " && suf=" |" && echo -e    "${RED}$pref$*$suf${ESC}";;
    *)                          echo      "Uncategorized Message!: $*";return;;
  esac
  #shift
}
#
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
debug_func 1 "Program start!"

echo "Counting until $MAX"

debug_func 2 "Entering WHILE statement!"

while [ $INI -ne $MAX ]; do

  debug_func 3 "\$INI's value before incrementing: $INI"

  let INI=$INI+1
  
  debug_func 3 "\$INI's value after  incrementing: $INI"
  
  echo "--$INI..."

done

debug_func 2 "Exiting WHILE statement!"

echo "I finished!"

debug_func 1 "End of program!"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
