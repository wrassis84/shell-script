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
# v1.0 28/11/2022, William Ramos de Assis Rezende:
#      - Program's first version;
#      - Added -h and -v options;
#
################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################
### VARIABLES DEFINITIONS ::::::::::::::::::::::::::::::::::::::
#
VERSION="v1.0"
INFO="HOSTNAME: $(hostname)
      USER: $(whoami)
      LOGGED USERS: $(who)
      UPTIME: $(uptime -p)
      DATE: $(date '%dd-%mm-%Y')
      KERNEL: $(uname -r)
"
LOAD=
UPDATES=
SYSBINFO=0
SYSLOAD=0
SYSUPDT=0
#
################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::
#
################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::
#
clear
while true
do
  clear
  echo    "::::::::::::::::::::::::::::::::::::::::::::::::::::"
  echo -e "\tBe Welcome, User: $USER!"
  echo    "::::::::::::::::::::::::::::::::::::::::::::::::::::"
  echo    "Choose an Option, Please!
  
           1 - Shows Basic System Informations.
           2 - Shows System Load.
           3 - Shows System's Updates Available.
  "
  echo -e -n "Choosen Option: "
  read OPT

  case "$OPT" in
    1) echo "$INFO"    && echo "Press [ENTER] to continue: " && read;;
    2) echo "$LOAD"    && echo "Press [ENTER] to continue: " && read;;
    3) echo "$UPDATES" && echo "Press [ENTER] to continue: " && read;;
    *) echo "Invalid Option!    Press [ENTER] to continue: " && read;;
  esac

done

[ $SYSBINFO -eq 1 ] && echo "$INFO"
[ $SYSLOAD  -eq 1 ] && echo "$LOAD"
[ $SYSUPDT  -eq 1 ] && echo "$UPDATES"

#echo "$USERS"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::
################################################################
