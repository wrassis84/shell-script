######## ENVIRONMENT ###########################################################

#!/usr/bin/env bash

######## ABOUT #################################################################

# Repository     : https://github.com/wrassis84/shell-script.git
# Author         : Aurelio Jargas -> https://aurelio.net
# Maintainer     : William Ramos de Assis Rezende
#
# "gobacknav.sh" : Adapted from 'https://aurelio.net/shell/dialog/navegando.sh'
#                  Example for use chained screens on dialog.
# Usage          : ./chained.sh
#
# PROGRAM'S FLOWCHART:
#
#                      [ BEGIN ]
#                    +-----------+
#                    |   menu    |-------CANCEL--->----+
#      .------------>+----Ok-----+                     |
#      `--ESC--------|   name    |-------CANCEL--->----+
#      .------------>+----Ok-----+                     |       +----------+
#      `--ESC--------|    age    |----CANCEL--->----+--------> |   EXIT!  |
#      .--------> +----Ok----------+                   |       | Program  |
#      `--ESC-----| marital status |--CANCEL--->-------+       +----------+
#      .--------> +----Ok----------+                   |
#      `--ESC--------| preferences |--CANCEL--->-------+
#                    +----Ok-------+
#                     |   ending  |
#                     +-----------+
#                        [ END ]
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
next=first

while : ; do
  case "$next" in
    first)
      next=name
      dialog --backtitle 'Data Catch' \
        --msgbox 'Welcome at Data Catch!' 0 0
    ;;
    name)
      previous=first
      next=age
      name=$(dialog --stdout          \
        --backtitle 'Data Catch'      \
        --inputbox  'Your name:' 0 0  )
    ;;
    age)
      previous=name
      next=marital
      age=$(dialog --stdout                  \
        --backtitle 'Data Catch'             \ 
        --menu      'How old are you?' 0 0 0 \
        'under 15 years old' ''              \
        'between 15 and 25 years old' ''     \
        'between 25 and 40 years old' ''     \
        'over 40 years old' ''               )
    ;;
    marital)
      previous=age
      next=preferences
      marital=$(dialog --stdout             \
        --backtitle 'Data Catch'            \
        --radiolist 'Marital Status:' 0 0 0 \
        'not married' '' off                \
        'engaged' ''     off                \
        'married' ''     on                 \
        'widower' ''     off                )
    ;;
    preferences)
      previous=marital
      next=final
      preferences=$(dialog --stdout           \
        --separate-output                     \
        --backtitle 'Data Catch'              \
        --checklist 'What do you like?' 0 0 0 \
        'play soccer' ''    off               \
        'fishing' ''        off               \
        'go to the mall' '' off               \
        'ride bike' ''      off               \
        'camping' ''        off               \
        'sleep' ''          off               )  
    ;;
    final)
      dialog                            \
        --cr-wrap                       \
        --sleep 10                      \
        --backtitle 'Data Catch'        \
        --title 'Thanks for answering!' \
        --infobox "
        Informed Data
        Name          : $name
        Age           : $age
        Marital Status: $marital
        Preferences   : \n$preferences
        " 14 40
      break
    ;;
    *)
      echo "Unknow Screen '$next'."
      echo Exiting Program...
      exit
  esac
  return=$?
  [ $return -eq 255 ] && next=$previous # if ESC pressed return to previous scr
  [ $return -eq 1   ] && break          # if CANCEL pressed exit program
done
#
######## MAIN CODE - END #######################################################