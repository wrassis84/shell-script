################################################################################
#
#!/usr/bin/env bash
#
################################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# Repository  : https://github.com/wrassis84/shell-script
# Author      : William Ramos de Assis Rezende
# Maintainer  : William Ramos de Assis Rezende
#
# "Parser.sh" : This program is a generic parser for config files.
#               This program will parse the configuration files and
#               treat them as inputs to the main program.
# Usage       :
#              ./Parser.sh
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.1 19/12/2022, William Ramos de Assis Rezende:
#  - Parser receives and parsing config file by "$1" statement;
#
# v1.0 16/12/2022, William Ramos de Assis Rezende:
#  - Parser's first version;
#
################################################################################
### TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# zsh 5.8.1
#
################################################################################
### VARIABLE DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
CONFIG_FILE="$1"
#
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# Does the config file exist?
[ ! -e "$CONFIG_FILE" ] \
                     && echo -n "Missing config file "$CONFIG_FILE" file!\n"   \
                     && echo -n "[ENTER] to continue:" && read REPLY && clear  \
                     && exit 1
# Does the config file have read permission?
[ ! -r "$CONFIG_FILE" ] \
                     && echo -n "No read permission on "$CONFIG_FILE" file!\n" \
                     && echo -n "[ENTER] to continue:" && read REPLY && clear  \
                     && exit 1
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
while read -r line
do
  [ "$(echo $line | cut -c1)" = "#" ] && continue   #skip if commented line
  [ ! "$line" ]                       && continue   #skip if empty line
  #stores "$1"'s 1st field value on local variable called "key"
  key="$(echo $line | cut -d = -f 1)"
  #stores "$1"'s 2nd field value on local variable called "value"
  value="$(echo $line | cut -d = -f 2)"
  echo "CONF_$key=$value"
done < "$CONFIG_FILE"  #uses each line of "CONFIG_FILE" as input
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
