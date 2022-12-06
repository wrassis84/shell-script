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
# This program will show a word in capital letters and with exclamations.
#
# Usage:
# ./Shout.sh
# In this example, we will show a word in capital letters.
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.0 06/12/2022, William Ramos de Assis Rezende:
#   - Program's first version;
#
################################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################################
### VARIABLE DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
DEBUG=1 # Debugging: "0" turn off, "1" turn on
VERSION="v1.0"
WORD="gritaria"
#
################################################################################
### FUNCTION DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
debug_func() {
  [ "$DEBUG" = 1 ] && echo "----{ $*"
}

################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
WORD="     $WORD     "          # Add 5 spaces around.
debug_func "WORD with spaces           : [$WORD]"
WORD=$(echo $WORD | tr ' ' '!') # Replace spaces with exclamation marks.
debug_func "WORD with exclamation marks: [$WORD]"

WORD=$(echo $WORD | tr a-z A-Z) # Converts WORD into uppercase.
echo "$WORD"                    # Shows WORD
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
