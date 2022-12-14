#!/usr/bin/env bash
#
# BitcoinQuote.sh - Check the latest Bitcoin quote.
#
# Site      : https://4fasters.com.br
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
# -------------------------------------------------------------
# Description:
#
# This program will get latest Bitcoin quote by the API XXX.
#
# Usage: ./BitcoinQuote.sh -d 1
#        In this sample will run the program with debug level 1.
# --------------------------------------------------------------
# Changelog:
#
#   v1.1 19/08/2022, William Ramos de Assis Rezende:
#        - Added feature -h for help;
#        - Added feature -f for specify another file;
#   v1.0 15/06/2022, William Ramos de Assis Rezende:
#        - Program's first version;
# --------------------------------------------------------------
# Testing environment:
#   zsh 5.8.1
# --------------------------------------------------------------
# Thanks:
#   Bender Bending Rodriguez - Find a login bug;
#   Turanga Leela - Suggestion sent to add the -h option;
# --------------------------------------------------------------
# Variables Definitions:
#
PARAMMETER=1
# --------------------------------------------------------------
# Tests/Validations:
#
# --------------------------------------------------------------
# Function Definitions:
#
# --------------------------------------------------------------
# "Code Execution"
# BEGIN OF CODE ------------------------------------------------
#
# Comments need to be concise and clear. They can be in 
# question format:
# Is Lynx installed?
[ ! -x "$(which lynx)" ] && echo "Lynx isn't installed!"

if [ $PARAMMETER -gt 0 ]
then
  if [ $PARAMMETER -gt 1 ] # Any comment!
  then
    if [ $PARAMMETER -gt 2 ]
    then
      echo "Hi!"
    fi
  fi
fi

# Long command lines should be broken and indented.
# Bad :\
find / -iname "*.so" -user william -type f -size +1M -exec ls {} \;
# Good ;)
find / -iname "*.so" \
       -user william \
       -type f       \
       -size +1M     \
       -exec ls {}   \;
#
# END OF CODE --------------------------------------------------
