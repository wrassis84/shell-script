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
# "TecMintNews.sh": Shows homepage articles from "www.tecmint.com" website.
#
# Usage           :
#                   ./TecMintNews.sh
#
################################################################################
### CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
# v1.1 20/12/2022, William Ramos de Assis Rezende:
#  - Added parser to manipulate configuration file;
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
CONFIG_FILE="TecMintNews.conf"
NUMLINES=  # turn on/off line numbering
FGCOLOR=

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
[ ! -x "$(which lynx)" ] && sudo apt install -y lynx
# Is sed installed?
#[ ! -x "$(which sed)" ]  && echo "sed isn't installed! Please, Install it!"
#
################################################################################
### BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
eval $(./Parser.sh $CONFIG_FILE)

[ "$(echo $CONF_NUMLINES)" = "1" ] && NUMLINES="1" #&& \
FGCOLOR="$(echo $CONF_FGCOLOR)"

# Extracts the website source from "URL"
lynx -source "$URL" | \
    # filter only titles that interest us
    grep 'class="entry-title"' | \
    # remove the rest of HTML code and stores them on "TMP_FILE"
    sed 's/<h2 class.*bookmark">//;s/<\/a.*//' > "$TMP_FILE" #&& cat "$TMP_FILE"

[ "$NUMLINES" = "1" ] && cat -n "$TMP_FILE" > "$SRC_FILE" || \
# If "$NUMLINES" = "0" in "$CONFIG_FILE"
cat "$TMP_FILE" > "$SRC_FILE" && rm "$TMP_FILE" #&& cat "$SRC_FILE" && read REPLY

while read -r headlines
do
  echo "\033[${FGCOLOR};1mTitle: $headlines${ESC}"
done < "$SRC_FILE"
#
### END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################################
# FIXME: Handle HTML special characteres like "&#8217;";
# TODO: Add option to number output lines;
