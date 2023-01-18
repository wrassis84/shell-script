######## ENVIRONMENT ###########################################################

#!/bin/sh

######## ABOUT #################################################################

# Repository   : https://github.com/wrassis84/<REPO>
# Author       : William Ramos de Assis Rezende
# Maintainer   : William Ramos de Assis Rezende
#
# lstun.sh     : List, Add and Remove users from DataTex systems.
# Usage        : ./lstun.sh

######## TESTING ENVIRONMENT ###################################################
# zsh 5.1.8
######## VARIABLES #############################################################
#
COLOR=
HIDDEN=
SUBDIRS=
DETAILS=
#
######## MAIN CODE - START #####################################################
#
dialog --yesno 'Use colors?'             0 0 && COLOR='--color=yes'
dialog --yesno 'Show hidden files?'      0 0 && HIDDEN='-a'
dialog --yesno 'Include subdirectories?' 0 0 && SUBDIRS='-R'
dialog --yesno 'Show details?'           0 0 && DETAILS='-l'

ls $COLOR $HIDDEN $SUBDIRS $DETAILS
#
######## MAIN CODE - END #######################################################
