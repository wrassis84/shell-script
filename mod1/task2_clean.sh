#!/usr/bin/env bash

for i in $(seq 10)
do
  [[ $(( $i % 2)) -eq 0 ]] && echo "The number $i is divisible by 2!"
done
