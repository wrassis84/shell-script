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
INFO="HOSTNAME: $(hostname)"
LUSERS="ALL LOGGED USERS:
$(who)"
UPTIME="UPTIME: $(uptime -p)"
K_VERSION="KERNEL RELEASE: $(uname -r)"
VERSION="v1.1"
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
           1 - Shows Hostname.
           2 - Shows All Logged Users.
           3 - Shows System Uptime.
           4 - Shows Kernel Release.
           5 - Updates System's Package List.
           6 - Updates System's Packages.
           7 - Shows Program's Version.
           0 - Exit Program.
  "
  echo -e -n "Option: "
  read OPT

  case "$OPT" in
    1) echo -e -n "$INFO"      && echo -e -n "\n[ENTER] to continue: " && read;;
    2) echo -e -n "$LUSERS"    && echo -e -n "\n[ENTER] to continue: " && read;;
    3) echo -e -n "$UPTIME"    && echo -e -n "\n[ENTER] to continue: " && read;;
    4) echo -e -n "$K_VERSION" && echo -e -n "\n[ENTER] to continue: " && read;;
    5) sudo apt-get -qq update &>/dev/null || \
                            echo -e -n "System's Package List Updated!" && \
                            echo -e -n "\n[ENTER] to continue: "  && read;;
    6) sudo apt-get -qq upgrade &>/dev/null && \
                            echo -e -n "System's Packages Updated!" && \
                            echo -e -n "\n[ENTER] to continue: " && read;;
    7) echo "$VERSION"   && echo -e -n   "[ENTER] to continue: " && read;;
    0)                      echo -e -n "Exiting!" && sleep 1 && clear && exit 0;;
    *)    echo -e -n "Invalid Option!   \n[ENTER] to continue: " && read;;
  esac
done
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::
################################################################
