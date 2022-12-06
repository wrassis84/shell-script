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
VERSION="v1.0"
#
################################################################################
### FUNCTION DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
debug_func() {
  [ $1 -le $DEBUG_LEVEL ] || return 
  local prefix
  case "$1" in
  1) prefix=">--{ ";;
  2) prefix=">----{ ";;
  3) prefix=">------{ ";;
  *) echo "Uncategorized Message!: $*"; return;;
  esac
  shift
  echo $prefix$*
}
#
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
debug_func 1 "Program's beginning!"

echo "Counting until $MAX"

debug_func 2 "Entering WHILE statement!"

while [ $INI -ne $MAX ]; do

  debug_func 3 "\$INI value before incrementing: $INI"

  let INI=$INI+1
  
  debug_func 3 "\$INI value after  incrementing: $INI"
  
  echo "$INI..."

done

debug_func 2 "Exiting WHILE statement!"

echo "I finished!"

debug_func 1 "End of program!"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
