################################################################################
#
#!/usr/bin/env bash
#
################################################################################
### ABOUT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# TecMintNews.sh - Shows homepage articles from "www.tecmint.com" website. 
#
# Site      : https://github.com/wrassis84/shell-script
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
################################################################################
### DESCRIPTION ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will show homepage articles from "www.tecmint.com" website. 
#
# Usage:
# ./TecMintNews.sh
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.0 14/12/2022, William Ramos de Assis Rezende:
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
# For colored output ;)
GREEN="\033[32;1m"
YELLOW="\033[33;1m"
RED="\033[31;1m"
PURPLE="\033[35;1m"
CIAN="\033[36;1m"
VERSION="v1.0"

URL="https://www.tecmint.com/" # Press CTRL+u in browser shows site source code.
TMP_FILE="temp.out"
SRC_FILE="headlines.out"

#
################################################################################
### FUNCTION DECLARATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
################################################################################
### TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Is lynx installed?
#[ ! -x "$(which lynx)" ] && echo "lynx isn't installed! Please, Install it!"
[ ! -x "$(which lynx)" ] && sudo apt install -y lynx
# Is sed installed?
#[ ! -x "$(which sed)" ]  && echo "sed isn't installed! Please, Install it!"
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
lynx -source "$URL" | \
    grep 'class="entry-title"' | \
    sed 's/<h2 class.*bookmark">//;s/<\/a.*//' > "$TMP_FILE"
cat "$TMP_FILE" > "$SRC_FILE" && rm "$TMP_FILE"

while read -r headlines
do
    echo "${GREEN} Title: ${CIAN}$headlines${ESC}"
done < "$SRC_FILE"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
# FIXME: Handle HTML special characteres like "&#8217;";
# TODO: Add option to number output lines;
