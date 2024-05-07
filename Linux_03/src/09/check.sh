#!/bin/bash

argc=$#
arg_count=0

if [[ $argc -ne $arg_count ]]
then
    echo "The script runs without parameters" ; exit 1
fi
