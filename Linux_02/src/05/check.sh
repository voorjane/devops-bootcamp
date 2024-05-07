#!/bin/bash

re='a*+\/+$'
argc=$#
if [[ $argc -ne 1 ]]
then
  echo "This script runs with only one parameter." ; exit 1
elif ! [[ $1 =~ $re ]]
then
  echo "Wrong directory." ; exit 1
elif [[ ! -d "$1" ]]
then
  echo "Directory not found." ; exit 1
fi
