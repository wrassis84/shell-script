#!/usr/bin/env bash
#
################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# SysInfo.sh - Show system informations.
#
# Site      : https://github.com/wrassis84/shell-script
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
################################################################
### DESCRIPTION ::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will show informations about system.
#
# Usage:
# ./SysInfo.sh
# This will open a menu with options for be choosen.
#
################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.1 29/11/2022, William Ramos de Assis Rezende:
#      - Added option "4" for show Program's version;
#      - Added option "0" for EXIT Program;
# v1.0 29/11/2022, William Ramos de Assis Rezende:
#      - Program's first version showing basic infos of system;
#
################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################
### VARIABLES DEFINITIONS ::::::::::::::::::::::::::::::::::::::
#
VERSION="v1.1"
INFO="HOSTNAME: $(hostname)
USER: $(whoami)
LOGGED USERS: $(who)
UPTIME: $(uptime -p)
DATE: $(date)
KERNEL: $(uname -r)"
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
  echo -e "\tBe Welcome, User $USER!"
  echo    "::::::::::::::::::::::::::::::::::::::::::::::::::::"
  echo    "Choose an Option, Please!
           1 - Shows Basic System Informations.
           2 - Shows System Load.
           3 - Shows System's Updates Available.
           4 - Shows Program's Version.
           0 - Exit Program.
  "
 #echo -e -n "Choosen Option: "
  echo -e -n "Option: "
  read OPT

  case "$OPT" in
    1) echo "$INFO"    && echo -e -n "\nPress [ENTER] to continue: " && read;;
    2) echo "$LOAD"    && echo -e -n "\nPress [ENTER] to continue: " && read;;
    3) echo "$UPDATES" && echo -e -n "\nPress [ENTER] to continue: " && read;;
    4) echo "$VERSION" && echo -e -n "\nPress [ENTER] to continue: " && read;;
    0)                   echo -e -n "Exiting!" && sleep 2 && clear && exit 0;;
    *) echo -e -n "Invalid Option!    \nPress [ENTER] to continue: " && read;;
  esac
done
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::
################################################################
