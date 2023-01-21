######## ENVIRONMENT ###########################################################

#!/usr/bin/env bash

######## ABOUT #################################################################

# Repository    : https://github.com/wrassis84/shell-script.git
# Author        : Aurelio Jargas -> https://aurelio.net
# Maintainer    : William Ramos de Assis Rezende
#
# "chained.sh"  : Adapted from 'https://aurelio.net/shell/dialog/encadeado.sh'
#                 Example for use chained screens on dialog.
# Usage         : ./chained.sh
#
# PROGRAM'S FLOWCHART:
#
#             [ BEGIN ]
#            +---------+
#            | screen1 |---Cancel/Esc--->---+
#            +----Ok---+                    |
#            | screen2 |---Cancel/Esc--->---+     +------------------+
#            +----Ok---+                    |---> | Did you give up? |
#            | screen3 |---Cancel/Esc--->---+     +------------------+
#            +----Ok---+                    |
#            | screen4 |---Cancel/Esc--->---+
#            +----Ok---+
#            |   end   |
#            +---------+
#              [ END ]
#
######## TESTING ENVIRONMENT ###################################################
# zsh 5.8.1
######## TESTS/VALIDATIONS #####################################################
#
# Is dialog installed?
[ ! -x "$(which dialog)" ] && sudo apt install -y dialog
#
######## FUNCTIONS #############################################################
#
# Function to call the "yesno" dialog box
yesorno(){
 dialog --yesno "$*" 0 0
}
#
######## MAIN CODE - START #####################################################
#
yesorno 'Do you want to continue?'                    &&
yesorno 'Were are on second screen. Lets continue?'   &&
yesorno 'Third screen. Lets continue?'                &&
yesorno 'Penultimate screen. And now, lets continue?' &&
echo    "You made it to the end... Congrats! ;)"      &&
exit

# This will be executed if the user press CANCEL/ESC. From here, we exit from
# chained menu 
#
echo "You gave up before reaching the end! :("
#
######## MAIN CODE - END #######################################################