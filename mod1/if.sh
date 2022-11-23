#!/usr/bin/env bash
VAR_1=" " 
VAR_2="bender"

if [[ "$VAR_1" = "$VAR_2" ]]; then
  echo "The variables are equal." 
fi

if [[ "$VAR_1" = "$VAR_2" ]]
then
  echo "The variables are equal." 
fi

if test "$VAR_1" = "$VAR_2" 
then
  echo "The variables are equal." 
fi

if [ "$VAR_1" = "$VAR_2" ]
then
  echo "The variables are equal." 
fi

# Here, the "&&" is equivalent to logical AND.
# echo command only will run if the two conditions would be true. 
[ "$VAR_1" = "$VAR_2" ] && echo "The variables are equal."

# Here, the "||" is equivalent to logical OR. 
# echo command will run if first condition would be false.
[ "$VAR_1" = "$VAR_2" ] || echo "The variables aren't equal."
