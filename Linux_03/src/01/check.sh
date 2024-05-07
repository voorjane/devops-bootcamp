#!/bin/bash

argc=$#
arg_count=6
num_regex='^[0-9]+$'
folder_regex='^[a-z]{1,7}$'
files_regex='^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$'
filesize_regex='[0-9]*kb$'

if [[ $argc -ne $arg_count ]]
then
  echo "This script runs with six parameters." ; exit 1
fi

path=$1
folders_count=$2
folders_chars=$3
files_count=$4
files_chars=$5
filesize_chars=$6
filesize=$(echo "$6" | awk -F"kb" '{print $1}')
file_extension=$(echo "$5" | awk -F "." '{print $2}')
file_chars=$(echo "$5" | awk -F "." '{print $1}')

if  [[ ${path:0:1} != / ]]
then
  echo "Wrong directory." ; exit 1
fi

if [[ ! -d "$path" ]]
then
  echo "Directory not found." ; exit 1
fi

if ! [[ $folders_count =~ $num_regex ]]
then
  echo "Second parameter must be an integer." ; exit 1
fi

if [[ $folders_count -lt 1 ]]
then
  echo "Folders count must be more than 0." ; exit 1
fi

if ! [[ $folders_chars =~ $folder_regex ]]
then
  echo "Third parameter must be english letters (up to 7 letters)." ; exit 1
fi
  
if ! [[ $files_count =~ $num_regex ]]
then
  echo "Fourth parameter must be an integer." ; exit 1
fi

if [[ $files_count -lt 1 ]]
then
  echo "Files count must be more than 0." ; exit 1
fi

if ! [[ $files_chars =~ $files_regex ]]
then
  echo "Fifth parameter must be english letters (up to 7 letters for name, up to 3 letters for extension)." ; exit 1
fi

if ! [[ $filesize_chars =~ $filesize_regex ]]
then
  echo "Invalid file size, must be in kb (100kb)." ; exit 1
fi

if [[ $filesize -le 0 ]] || [[ $filesize -gt 100 ]]
then
  echo "Filesize must be more than 0, but less than 100." ; exit 1
fi
