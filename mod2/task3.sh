#!/usr/bin/env bash
#
# GoldQuote.sh - Check the latest Gold quote.
#
# Site      : https://4fasters.com.br
# Author    : William Ramos de Assis Rezende
# Maintainer: Linus Torvalds
#
################################################################
# DESCRIPTION ::::::::::::::::::::::::::::::::::::::::::::::::::
#
# This program will get latest Gold quote for today.
#
# Usage: ./GoldQuote.sh -t utc
#        In this sample will run this program with time option
#        for UTC time.
#
################################################################
# CHANGELOG ::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#   v1.1 19/08/2022, Linus Torvalds:
#        - Added feature -h for help;
#        - Added feature -f for specify another file;
#   v1.0 15/06/2022, William Ramos de Assis Rezende:
#        - Program's first version;
#
################################################################
# TESTING ENVIRONMENT ::::::::::::::::::::::::::::::::::::::::::
#
#   zsh 5.8.1
#
################################################################
# THANKS :::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#   Bender Bending Rodriguez - Find a login bug;
#   Turanga Leela - Suggestion sent to add the -h option;
#   Hubert Farnsworth - Find a error in quote calculus;
#
################################################################
# VARIABLES DEFINITIONS ::::::::::::::::::::::::::::::::::::::::
#
comeca=0
ate=100
#
################################################################
# TESTS/VALIDATIONS ::::::::::::::::::::::::::::::::::::::::::::
#
# Is bc installed?
[ ! -x "$(which bc)" ] && echo "bc isn't installed! \
                                Please, Install it!"
#
################################################################
# BEGIN OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::
#
[ $comeca -gt $ate ] && exit 1

for i in $(seq $comeca $ate)
do
  for j in $(seq $i $ate)
  do
    printf "*";
  done
  printf "\n";
done
#
# END OF CODE ::::::::::::::::::::::::::::::::::::::::::::::::::
################################################################
