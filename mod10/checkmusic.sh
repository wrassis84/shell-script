######## ENVIRONMENT ###########################################################

#!/usr/bin/env bash

######## ABOUT #################################################################

# Repository    : https://github.com/wrassis84/<REPO>
# Author        : William Ramos de Assis Rezende
# Maintainer    : William Ramos de Assis Rezende
#
# checkmusic.sh : Example to practice dialog checklist.
# Usage         : ./checkcolor.sh

######## MAIN CODE - START #####################################################
### PROGRAM'S OUTPUT ALL IN ONE LINE:
#STYLES=$( dialog --stdout                                \
#      --checklist 'What music styles do you like?' 0 0 0 \
#      rock  '' ON  \
#      samba '' OFF \
#      metal '' ON  \
#      jazz  '' OFF \
#      pop   '' ON  \
#      mpb   '' OFF )
#clear
#echo "\033[1;5;33m You choose the following music styles $STYLES \033[m"

### PROGRAM'S OUTPUT ONE FOR LINE:
STYLES=$( dialog --stdout                                \
      --separate-output                                  \
      --checklist 'What music styles do you like?' 0 0 0 \
      ROCK  '' on  \
      SAMBA '' off \
      METAL '' on  \
      JAZZ  '' off \
      POP   '' on  \
      MPB   '' off )
echo "$STYLES" | while read LINE
do
  echo "--- $LINE"
done
#clear
#echo "\033[1;5;33m You choose the following music styles $STYLES \033[m"
######## MAIN CODE - END #######################################################
