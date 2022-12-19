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
# v1.1 19/12/2022, William Ramos de Assis Rezende:
#  - The parameters are passed apart by a generic parser;
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
CONFIG_FILE="Message.conf"
UPPERCASE=
COLORS=

GREEN="\033[32;1m"  #|
YELLOW="\033[33;1m" #|
RED="\033[31;1m"    #| Colors for output:
PURPLE="\033[35;1m" #|
CIAN="\033[36;1m"   #|

MESSAGE="
        Theory and practice sometimes clash. And when that happens,\n
        theory loses. Every single time.\n
        \t\t\t\t\t\t\b\b\b\b\b - Linus Torvalds
" #https://www.goodreads.com/author/quotes/92867.Linus_Torvalds
VERSION="v1.1" # Program's version
#
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
################################################################################
### FUNCTION DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
eval $(./Parser.sh $CONFIG_FILE)

[ "$(echo $CONF_UPPERCASE)" = "1" ] && UPPERCASE="1"
[ "$(echo $CONF_COLORS)" = "1" ]    && COLORS="1"

[ "$UPPERCASE" = "1" ] && MESSAGE="$(echo $MESSAGE | tr [a-z] [A-Z])"
[ "$COLORS" = "1" ]    && MESSAGE="$(echo    ${PURPLE}$MESSAGE)"

echo "$MESSAGE"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
### FIXME: Do not work well when using UPPERCASE and multiline quotes. :(
################################################################################
