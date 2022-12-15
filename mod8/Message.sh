################################################################################
#
#!/usr/bin/env bash
#
################################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# Message.sh - This program tests config files.
#
# Site      : https://github.com/wrassis84/shell-script
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
################################################################################
### DESCRIPTION ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will echo a message colored or not, uppercase or not. The options
# will be passed by a config file.
#
# Usage:
# ./Message.sh
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.0 15/12/2022, William Ramos de Assis Rezende:
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
CONFIG_FILE="Options.conf"
UPPERCASE=
COLORS=

GREEN="\033[32;1m"  #|
YELLOW="\033[33;1m" #|
RED="\033[31;1m"    #| Colors for output:
PURPLE="\033[35;1m" #|
CIAN="\033[36;1m"   #|

MESSAGE="
        Theory and practice sometimes clash. And when that happens,
        theory loses. Every single time.
                                                    - Linus Torvalds

        https://www.goodreads.com/author/quotes/92867.Linus_Torvalds
"
VERSION="v1.0" # Program's version
#
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
[ ! -r "$CONFIG_FILE" ] \
                     && echo -n "No read permission on "$CONFIG_FILE" file!\n" \
                     && echo -n "[ENTER] to continue:" && read REPLY && clear  \
                     && exit 1
#
################################################################################
### FUNCTION DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#   The "hdl_param_func" function read a config file and validates values
#   received from "main code" (by "$1") and assigns them to respective global
#   vars.
#

hdl_param_func() {
  #stores "$1"'s 1st field value on local variable called "parameter"
  local parameter="$(echo $line | cut -d= -f1)"
  #stores "$1"'s 2nd field value on local variable called "param_value"
  local param_value="$(echo $line | cut -d= -f2)"
  #validates values received from "$1" and
  #assigns them to respective global vars "UPPERCASE" and "COLORS"
  case "$parameter" in
    UPPERCASE) UPPERCASE="$param_value";;
    COLORS)    COLORS="$param_value"   ;;
  esac
}
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
while read -r line
do
  [ "$(echo $line | cut -c1)" = "#" ] && continue  #"true" if commented line
  [ ! "$line" ]                       && continue  #"true" if empty line
  #echo "$line"        #show each file's line  at time
  hdl_param_func "$line" #attributes "$line"'s value for
                         #"hdl_param_func" function as "$1"
done < "$CONFIG_FILE" #uses each line of "CONFIG_FILE" as input

echo "UPPERCASE's value: $UPPERCASE"
echo "COLORS's values: $COLORS"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
### TODO: Add RED color to error messages.
################################################################################
