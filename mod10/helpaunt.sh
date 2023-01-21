######## ENVIRONMENT ###########################################################

#!/usr/bin/env bash

######## ABOUT #################################################################

# Repository    : https://github.com/wrassis84/shell-script.git
# Author        : Aurelio Jargas -> https://aurelio.net
# Maintainer    : William Ramos de Assis Rezende
#
# "helpaunt.sh" : Adapted from 'https://aurelio.net/shell/dialog/tia.sh'
#                 Help your aunt to use the computer.
# Usage         : ./helpaunt.sh

######## MAIN CODE - START #####################################################
# This loop show the main menu
while : ; do
  answer=$(
    dialog --stdout                   \
      --title 'Menu'                  \
      --menu  'Hi, aunt! Choose one:' \
      0 0 0                           \
      1 'Browse web'                  \
      2 'Write a letter'              \
      3 'Play games'                  \
      4 'Waste time'                  \
      0 'Exit'                        )
  
  # If she pressed CANCEL or ESC, we will exit...
  [ $? -ne 0 ] && break

  case "$answer" in
    1) /usr/bin/mozilla 'http://google.com'        ;;
    2) /bin/gnome-text-editor                      ;;
    3) /usr/games/solitaire                        ;;
    4) /usr/X11R6/bin/xsnow ; /usr/X11R6/bin/xeyes ;;
    0) break                                       ;;
  esac
done
# Final message ;)
echo 'Bye, aunt!'
######## MAIN CODE - END #######################################################
