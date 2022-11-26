#!/usr/bin/env bash
#
################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# ListUsers.sh - List system users using "etc/passwd" file.
#
# Site      : https://github.com/wrassis84/shell-script.git
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
     $0 - [OPTIONS]:
        -h - Show this help.
        -v - Show program version.
        -s - Sort output alphabetically.
"
VERSION="v1.0"
#
################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::
#
################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::
#
if [ "$1" = "-h" ]; then
  echo "$USAGE_MESSAGE" && exit 0
fi

if [ "$1" = "-v" ]; then
  echo "$VERSION"       && exit 0
fi

if [ "$1" = "-s" ]; then
  echo "$USERS" | sort  && exit 0
fi

echo "$USERS"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::
################################################################
