#!/usr/bin/env bash
#
###############################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# ListUsers.sh - List system users using "etc/passwd" file.
#
# Site      : https://github.com/wrassis84/shell-script
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
###############################################################################
### DESCRIPTION :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will list system users and output shall can be
# manipulated of many ways.
#
# Usage:
# ./ListUsers.sh -s -u
# In this example, we will have all users sorted alphabetically
# and in capital letters.
#
###############################################################################
### CHANGELOG :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.3 26/11/2022, William Ramos de Assis Rezende:
#      - Added WHILE statement plus SHIFT and input validation;
#      - Added suport for using 2 options at sametime;
# v1.2 26/11/2022, William Ramos de Assis Rezende:
#      - Added -s option for sort output;
#      - Added -u option for uppercase output;
# v1.1 26/11/2022, William Ramos de Assis Rezende:
#      - Changed IF for CASE statement;
#      - Added "basename" statement;
# v1.0 25/11/2022, William Ramos de Assis Rezende:
#      - Program's first version;
#      - Added -h and -v options;
#
###############################################################################
### TESTING ENVIRONMENT :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
###############################################################################
### VARIABLES DEFINITIONS :::::::::::::::::::::::::::::::::::::::::::::::::::::
#
USERS="$(cat /etc/passwd | cut -d : -f 1)"
USAGE_MESSAGE="
  Help Menu for $(basename $0) Program:
  [OPTIONS]:
   -h - Show this help.
   -v - Show program version.
   -s - Sort output alphabetically.
   -u - Convert output to UPPERCASE.
   NOTE: When using two options we must place them like this:
         ./ListUsers.sh -s -u
"
VERSION="v1.3"
SORT_OUT=0
UPPERCASE=0
#
###############################################################################
### TESTS/VALIDATIONS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
###############################################################################
### BEGIN OF CODE :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
while test -n "$1"
do
  case "$1" in
    -h) echo "$USAGE_MESSAGE" && exit 0     ;;
    -v) echo "$VERSION" && exit 0           ;;
    -s) SORT_OUT=1                          ;;
    -u) UPPERCASE=1                         ;;
     *) echo -en "Invalid Option!\n " && echo -en "$USAGE_MESSAGE" \
        && echo -en "\n[ENTER] to continue: " && read \
        && clear && exit 0;;
  esac
  shift
done

set -xv # Turn On code debugging
[ $SORT_OUT -eq 1 ]  && USERS=$(echo "$USERS" | sort)
[ $UPPERCASE -eq 1 ] && USERS=$(echo "$USERS" | tr [a-z] [A-Z])
set +xv # Turn Off code debugging

echo "$USERS"
#
### END OF CODE :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
###############################################################################
