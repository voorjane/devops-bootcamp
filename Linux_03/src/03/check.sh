#!/bin/bash

argc=$#
arg_count=1
arg_regex='[1-3$]'

if [[ $argc -ne $arg_count ]]
then
  echo "This script runs with one parameter." ; exit 1
fi

parameter=$1

if ! [[ $parameter =~ $arg_regex ]]
then
  echo "Invalid parameter (1, 2 or 3)" ; exit 1
fi
