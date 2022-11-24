#!/usr/bin/env bash
#
# BitcoinQuote.sh - Check the latest Bitcoin quote.
#
# Site      : https://4fasters.com.br
# Author    : William Ramos de Assis Rezende
# Maintainer: William Ramos de Assis Rezende
#
# -------------------------------------------------------------
# Instructions:
#
# This program will get latest Bitcoin quote by the API XXX.
#
# Usage: ./BitcoinQuote.sh -d 1
#        In this sample will run the program with debug level 1.
# --------------------------------------------------------------
# Changelog:
#
#   v1.1 19/08/2022, William Ramos de Assis Rezende:
#        - Added feature -h for help;
#        - Added feature -f for specify another file;
#   v1.0 15/06/2022, William Ramos de Assis Rezende:
#        - Program's first version;
# --------------------------------------------------------------
# Testing environment:
#   zsh 5.8.1
# --------------------------------------------------------------
# Thanks:
#   Bender Bending Rodriguez - Find a login bug;
#   Turanga Leela - Suggestion sent to add the -h option;
# --------------------------------------------------------------
# Variables Definitions:
#
# --------------------------------------------------------------
# Tests/Validations:
#
# --------------------------------------------------------------
# Function Definitions:
#
# --------------------------------------------------------------
# "Code Execution":
# BEGIN OF CODE ------------------------------------------------
#
# Verifies if Lynx is installed.
[ ! -x "$(which lynx)" ] && echo "Lynx isn't installed!"
# END OF CODE --------------------------------------------------
