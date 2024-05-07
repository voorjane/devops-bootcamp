#!/bin/bash

argc=$#
arg_count=1
arg_regex='[1-4$]'

if [[ $argc -ne $arg_count ]]
then
  echo "This script runs with one parameter (1 - 4)." ; exit 1
fi

parameter=$1

if ! [[ $parameter =~ $arg_regex ]]
then
  echo "Invalid parameter (1 - 4)" ; exit 1
fi

for file in 1 2 3 4 5
do
  if ! [[ -f "../04/$file.log" ]]
  then
    echo "File $file.log not found! Restart your script in 04 folder" ; exit 1
  fi
done
