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
COLOR=$( dialog                \
      --stdout                 \
      --menu 'True Colors:'    \
      0 0 0                    \
      yellow 'the sun color'   \
      green  'the grass color' \
      blue   'the sky color'   )
clear
echo "\033[1;5;33m You choose the color $COLOR \033[m"
######## MAIN CODE - END #######################################################

