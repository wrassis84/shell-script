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
# "DataTex.sh"    : Library of functions for managing textual databases.
#
# Usage           : Run 'source DataTex.sh' to include it in your programs.
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
#
################################################################################
### VARIABLE DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
TMP_FILE="Temp.$$"  # temp file
SEP=:               # default field separator
RED="\033[31;1m"    #|
GREEN="\033[32;1m"  #|
YELLOW="\033[33;1m" #| Colors for output: 
PURPLE="\033[35;1m" #|
CIAN="\033[36;1m"   #|
ESC="\033[m"        # Escape character
#
################################################################################
### FUNCTION DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# This function remove a user of Database, before checking if it exists
DeleteReg_func () {
  grep -i -v "^$1$SEP" "$DB_FILE" > "$TMP_FILE"
  mv "$TMP_FILE" "$DB_FILE"
  echo "${YELLOW}INFO: Login '$login' succesfully removed of Database!"
}

# This function insert a user in Database, before checking if it exists
InsertReg_func () {
    echo "$*" >> "$DB_FILE" && \
    echo "${GREEN}INFO: Login '$login' succesfully inserted on Database!"
}
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
