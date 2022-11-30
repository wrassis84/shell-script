#!/usr/bin/env bash

for i in $(seq 10)
do
  rest=$(( $i%2 ))
  [[ $rest = 0 ]] && echo "$i is divisible by 2!"
done
