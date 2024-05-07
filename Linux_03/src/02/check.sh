#!/bin/bash

argc=$#
arg_count=3
folder_regex='^[a-z]{1,7}$'
files_regex='^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$'
filesize_regex='[0-9]*Mb$'

if [[ $argc -ne $arg_count ]]
then
  echo "This script runs with three parameters." ; exit 1
fi

folders_chars=$1
files_chars=$2
filesize_chars=$3
filesize=$(echo "$3" | awk -F"Mb" '{print $1}')
file_extension=$(echo "$2" | awk -F "." '{print $2}')
file_chars=$(echo "$2" | awk -F "." '{print $1}')

if ! [[ $folders_chars =~ $folder_regex ]]
then
  echo "First parameter must be english letters (up to 7 letters)." ; exit 1
fi

if [[ ${#folders_chars} -gt 7 ]]; then
  echo "First parameter should be no more than 7 characters long" ; exit 1
fi

if ! [[ $files_chars =~ $files_regex ]]
then
  echo "Second parameter must be english letters (up to 7 letters for name, up to 3 letters for extension)." ; exit 1
fi

if ! [[ $filesize_chars =~ $filesize_regex ]]
then
  echo "Invalid file size, must be in Mb (max 100Mb)." ; exit 1
fi

if [[ $filesize -le 0 ]] || [[ $filesize -gt 100 ]]
then
  echo "Filesize must be more than 0, but less than 100." ; exit 1
fi
