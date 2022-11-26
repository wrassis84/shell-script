#!/usr/bin/env bash
#
################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# ListUsers.sh - List system users using "etc/passwd" file.
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
# ./ListUsers.sh
# In this example, we will have all system users in the order
# they appear in the "/etc/passwd" file.
#
################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.0 25/11/2022, William Ramos de Assis Rezende:
#      - Program's first version;
# v1.1 26/11/2022, William Ramos de Assis Rezende:
#      - Added -h option for help;
#      - Added -v option for program version;
#      - Added -s option for sort output;
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
  $(basename $0)
  [OPTIONS]:
   -h - Show this help.
   -v - Show program version.
   -s - Sort output alphabetically.
"
VERSION="v1.1"
SORT_OUT=0
#
################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::
#
################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::
#
case "$1" in
  -h) echo "$USAGE_MESSAGE" && exit 0 ;;
  -v) echo "$VERSION" && exit 0       ;;
  -s) SORT_OUT=1                      ;;
   *) echo "$USERS"                   ;;
esac
[ $SORT_OUT -eq 1 ] && echo "$USERS" | sort
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::
################################################################
