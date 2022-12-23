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
# This function cuts fields from Database file
extractfields_func () {
    local login="$(echo $1 | cut -d $SEP -f 1)"  # cuts the 1st field
    local name="$(echo $1 | cut -d $SEP -f 2)"   # cuts the 2nd field
    local age="$(echo $1 | cut -d $SEP -f 3)"    # cuts the 3rd field
    local gender="$(echo $1 | cut -d $SEP -f 4)" # cuts the 4th field

    echo -e "${YELLOW}login:  $login"
    echo -e "${YELLOW}name:   $name"
    echo -e "${YELLOW}age:    $age"
    echo -e "${YELLOW}gender: $gender"
}

# This function list all users on Database file after fields cutting
listusers_func () {
  while read -r line
  do
    [ "$(echo $line | cut -c1)" = "#" ] && continue #skip commented lines
                          [ ! "$line" ] && continue #skip empty lines
    [ "$(echo $line | grep login)"  ]   && continue #skip lines with "login"
    extractfields_func "$line"
  done < "$DB_FILE"
}

# This function checks if a user exists on Database file
checkusers_func () {
  grep -i -q "$1$SEP" "$DB_FILE"
  #[ "$?" = "0" ] && echo "${YELLOW}WARN: User '$1' already exists on Database!"
  #[ "$?" = "1" ] && echo "${YELLOW}INFO: User '$1' not exists on Database!"
}

# This function insert a user in Database, before checking if it exists
insertusers_func () {
  local login="$(echo $1 | cut -d $SEP -f 1)"
  if checkusers_func "$login"
  then
    echo "${RED}WARN: Login '$login' already exists on Database!"
  else
    # appends register at end of Database file
    echo "$*" >> "$DB_FILE" && \
    echo "${GREEN}INFO: Login '$login' succesfully inserted on Database!"
  fi
}
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
