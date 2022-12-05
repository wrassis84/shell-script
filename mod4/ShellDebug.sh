#!/usr/bin/env bash
#
################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# ShellDebug.sh - This program tests debugging levels.
#
# Site      : https://github.com/wrassis84/shell-script
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
################################################################
### DESCRIPTION ::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will list system users and output shall can be
# manipulated of many ways.
#
# Usage:
# ./ListUsers.sh -d 1
# In this example, we will run the program in debug level 1.
#
################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.0 05/12/2022, William Ramos de Assis Rezende:
#   - Program's first version;
#
################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################
### VARIABLES DEFINITIONS ::::::::::::::::::::::::::::::::::::::
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
################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::
#
################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::
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
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::
################################################################
