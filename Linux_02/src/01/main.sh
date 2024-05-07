#!/bin/bash

re='[0-9]+$'
argc=$#
if [[ $1 =~ $re || $argc -ne 1 ]] ; then
  echo "Wrong input" ; exit 1
fi
echo "$1"
exit 0
