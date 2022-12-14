################################################################################
#
#!/usr/bin/env bash
#
################################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# CutHeads.sh - This program extracts news headlines from a website. 
#
# Site      : https://github.com/wrassis84/shell-script
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
################################################################################
### DESCRIPTION ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will extract news headlines from a website. 
#
# Usage:
# ./CutHeads.sh
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.0 13/12/2022, William Ramos de Assis Rezende:
#  - Program's first version;
#
################################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################################
### VARIABLE DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#DEBUG=0
#DEBUG_LEVEL=0
#USAGE_MESSAGE="
#  Help Menu for $(basename $0) Program:
#  [OPTIONS]:
#   -h - Show this help.
#   -v - Show program version.
#   -d - Choose debug level. We have "1" and "2" levels.
#   NOTE: Debug level must be like this:
#   ./Color.sh -d 1
#   ./Color.sh -d 2
#"
# The debug level will passed by "$1": ./Colors.sh -d 1
#DEBUG_LEVEL=${1:-0}
# Colors for debug messages according level:
GREEN="\033[32;1m"  # Level 1
YELLOW="\033[33;1m" # Level 2
RED="\033[31;1m"    # Level 3
PURPLE="\033[35;1m"
CIAN="\033[36;1m"

VERSION="v1.0"
URL="http://lxer.com/" # Press CTRL+u in browser to view website source code ;)
SRC_FILE="headlines.out"
#
################################################################################
### FUNCTION DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#   The "debug_func" function below displays debug messages according to desired
#   debug level.
#   To use it, just place it on the desired line with the debug level as an
#   argument and the "DEBUG MESSAGE" between double quotes. We can use the
#   following levels:
#   1 - generic messages          (location, eg: START/END of the program);
#   2 - flow location messages    (eg entering/leaving WHILE);
#   3 - content of important vars (e.g. $VAR's value before/after incrementing)
#
#debug_func() {
#    [ $1 -le $DEBUG_LEVEL ] && echo -e "${2}Debug $* -----"
#}
#
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Is lynx installed?
#[ ! -x "$(which lynx)" ] && echo "lynx isn't installed! Please, Install it!"
[ ! -x "$(which lynx)" ] && sudo apt install -y lynx
# Is sed installed?
[ ! -x "$(which sed)" ]  && echo "sed isn't installed! Please, Install it!"
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
lynx -source "$URL" | \
       grep 'blurb' | \
       sed 's/<div.*storyheadline">//;s/<\/span.*//' > headlines.out

while read -r headlines
do
    echo "${GREEN} Title: ${CIAN}$headlines${ESC}"
done < "$SRC_FILE"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
