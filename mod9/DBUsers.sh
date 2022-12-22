################################################################################
#
#!/usr/bin/env bash
#
################################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# Repository      : https://github.com/wrassis84/shell-script
# Author          : William Ramos de Assis Rezende
# Maintainer      : William Ramos de Assis Rezende
#
# "DBUsers.sh"      : This program handles ".txt" database files.
#
# Usage           :
#                   ./DBUsers.sh
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.0 21/12/2022, William Ramos de Assis Rezende:
#  - Program's first version;
#
################################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Does the database file exist?
[ ! -e "$DB_FILE" ] \
        && echo    "${RED}ERROR: Missing database file '$DB_FILE'!"${ESC}  \
        && echo -n "[ENTER] to continue:" && read REPLY && clear           \
        && exit 1
# Does the database file have read permission?
[ ! -r "$DB_FILE" ] \
        && echo    "${RED}ERROR: No read permission on '$DB_FILE'!"${ESC}  \
        && echo -n "[ENTER] to continue:" && read REPLY && clear           \
        && exit 1
# Does the database file have write permission?
[ ! -w "$DB_FILE" ] \
        && echo    "${RED}ERROR: No write permission on '$DB_FILE'!"${ESC} \
        && echo -n "[ENTER] to continue:" && read REPLY && clear           \
        && exit 1
#
################################################################################
### VARIABLE DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
DB_FILE="Users.txt" # Database file
SEP=:

RED="\033[31;1m"    #|
GREEN="\033[32;1m"  #|
YELLOW="\033[33;1m" #| Colors for output: 
PURPLE="\033[35;1m" #|
CIAN="\033[36;1m"   #|
ESC="\033[m"

VERSION="v1.0"
#
################################################################################
### FUNCTION DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
extractfields_func () {
    local login="$(echo $1 | cut -d $SEP -f 1)"
    local name="$(echo $1 | cut -d $SEP -f 2)"
    local age="$(echo $1 | cut -d $SEP -f 3)"
    local gender="$(echo $1 | cut -d $SEP -f 4)"

    echo -e "${YELLOW}login:  $login"
    echo -e "${YELLOW}name:   $name"
    echo -e "${YELLOW}age:    $age"
    echo -e "${YELLOW}gender: $gender"
}

listusers_func () {
  while read -r line
  do
    [ "$(echo $line | cut -c1)" = "#" ] && continue #skip commented lines
                          [ ! "$line" ] && continue #skip empty lines
    extractfields_func "$line"
  done < "$DB_FILE"
}
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
# FIXME: Handle HTML special characteres like "&#8217;";
# TODO: Add option to number output lines;
