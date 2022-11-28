#!/usr/bin/env bash

echo "=== FOR type 1"
for (( i = 0; i <= 10; i++ )); do
  echo $i
done

echo "=== FOR type 2"
for i in $(seq 10)
do
  echo $i
done

echo "=== FOR type 3"
Characteres=(
'Bender'
'Fry'
'Leela'
'Amy'
'Hermes')
for i in "${Characteres[@]}"
do
  echo "$i"
done

echo "=== WHILE"
count=0
while [[ $counter -lt ${#Characteres[@]} ]]; do
  echo $counter
  counter=$((counter+1))
done
