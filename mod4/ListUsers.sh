################################################################################
#
#!/usr/bin/env bash
#
################################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# ListUsers.sh - List system users using "etc/passwd" file.
#
# Site      : https://github.com/wrassis84/shell-script
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
################################################################################
### DESCRIPTION ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will list system users and output shall can be
# manipulated of many ways.
#
# Usage:
# ./ListUsers.sh -s -u 1
# In this example, we will have all users sorted alphabetically
# and in capital letters.
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# v1.4 07/12/2022, William Ramos de Assis Rezende:
#  - Added custom debug function that shows debug messages colored according
#    to chosen debug level.
# v1.3 26/11/2022, William Ramos de Assis Rezende:
#  - Added WHILE statement plus SHIFT and input validation;
#  - Added suport for using 2 options at sametime;
# v1.2 26/11/2022, William Ramos de Assis Rezende:
#  - Added -s option for sort output;
#  - Added -u option for uppercase output;
# v1.1 26/11/2022, William Ramos de Assis Rezende:
#  - Changed IF for CASE statement;
#  - Added "basename" statement;
# v1.0 25/11/2022, William Ramos de Assis Rezende:
#  - Program's first version;
#  - Added -h and -v options;
#
################################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################################
### VARIABLE DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
USERS="$(cat /etc/passwd | cut -d : -f 1)"
HELP_MSG="
  Help Menu for $(basename $0) Program:
  [OPTIONS]:
   -h - Show this help.
   -v - Show program version.
   -s - Sort output alphabetically.
   -u - Convert output to UPPERCASE.
    1 - Show debug message at level 1.
    2 - Show debug message at level 2.
    3 - Show debug message at level 3.
   NOTE: When using two options or plus we must place them like this:
         ./ListUsers.sh -s -u 2
"
SORT_OUT=0
UPPERCASE=0
# The debug level will passed by "$3": ./ListUsers.sh -s -u 2
DEBUG_LEVEL=${3:-0}
# Colors for debug messages according level; ${GREEN} to use on code.
GREEN="\033[32;1m" 
YELLOW="\033[33;1m"
RED="\033[31;1m"
ESC="\033[m"

VERSION="v1.3"
#
#################################################################################
### FUNCTION DECLARATION ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#   The "#debug_func" function below displays debug messages according to desired
#   debug level.
#   To use it, just place it on the desired line with the debug level as an
#   argument and the "DEBUG MESSAGE" between double quotes. We can use the
#   following levels:
#   1 - generic messages          (location, eg: START/END of the program);
#   2 - flow location messages    (eg entering/leaving WHILE);
#   3 - content of important vars (e.g. $VAR's value before/after incrementing);
#   4 - content of secondary variables;
#
debug_func() {
  [ $1 -le $DEBUG_LEVEL ] || return
  local pref="| "
  local suf=" |"
  case "$1" in
    1) echo -e  "${GREEN}$pref$*$suf${ESC}"            ;;
    2) echo -e "${YELLOW}$pref$*$suf${ESC}"            ;;
    3) echo -e    "${RED}$pref$*$suf${ESC}"            ;;
    *) echo       "Uncategorized Message!: $*"; return ;;
  esac
  #shift
}
#
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#debug_func 1 "Program start!"
#debug_func 3 "\$SORT_OUT's value before choosing: $SORT_OUT"
#debug_func 3 "\$UPPERCASE's value before choosing: $UPPERCASE"
#debug_func 2 "Entering WHILE!"
while test -n "$1"; do # True if "$1" is not null
  case "$1" in
       -h) echo "$HELP_MSG" && exit 0 ;;
       -v) echo "$VERSION" && exit 0       ;;
       -s) SORT_OUT=1                      ;;
       -u) UPPERCASE=1                     ;;
    [1-3]) DEBUG_LEVEL=$1                  ;;
        *) echo -n "Invalid Option!\n " && echo "${YELLOW}$HELP_MSG${ESC}" \
        && echo -n "[ENTER] to continue:" && read REPLY                    \
        && clear && exit 0                 ;;
  esac
  shift
done
#debug_func 2 "Leaving WHILE!"
#set -xv # Uncomment for turn on code debugging :)

[ $SORT_OUT -eq 1 ]  && USERS=$(echo "$USERS" | sort)
#debug_func 3 "\$SORT_OUT's value after choosing: $SORT_OUT"
[ $UPPERCASE -eq 1 ] && USERS=$(echo "$USERS" | tr [a-z] [A-Z])
#debug_func 3 "\$UPPERCASE's value after choosing: $UPPERCASE"

#set +xv # Uncomment for turn off code debugging :(

echo "$USERS"
#debug_func 1 "End of program!"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
