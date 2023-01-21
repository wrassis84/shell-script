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

######## MAIN CODE - START #####################################################
dialog --radiolist 'True Colors:' 0 0 0 \
      yellow 'the sun color'   OFF \
      green  'the grass color' ON  \
      blue   'the sky color'   OFF
#clear
#echo "\033[1;5;33m You choose the color $COLOR \033[m"
######## MAIN CODE - END #######################################################
