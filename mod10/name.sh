######## ENVIRONMENT ###########################################################

#!/usr/bin/env bash

######## ABOUT #################################################################

# Repository      : https://github.com/wrassis84/<REPO>
# Author          : William Ramos de Assis Rezende
# Maintainer      : William Ramos de Assis Rezende
#
# DataTex.sh      : List, Add and Remove users from DataTex systems.
# Requirements    : LibTex.sh
# Usage           : DataTex.sh [ list | add | remove ]

######## VARIABLES #############################################################

######## MAIN CODE - START #####################################################
#dialog --inputbox 'Type your name:' 0 0 2>/tmp/name.txt

#name=$( cat /tmp/name.txt )
#echo "Your name's: $name"

name=$( dialog --stdout --inputbox 'Type your name:' 0 0 )
echo "Your name's: $name"
######## MAIN CODE - END #######################################################
