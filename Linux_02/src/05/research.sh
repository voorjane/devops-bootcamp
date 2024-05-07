#!/bin/bash

directory=$1
echo "Total number of folders (including all nested ones) = $(sudo find "$directory" -type d | awk NR\>1 | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$(sudo du -ah $directory | sort -hr | head -n 6 | tail -n 5 | cat -n | awk '{printf("%d - %s, %sB\n", $1, $3, $2)}')"
echo "Total number of files = $(sudo find $directory -type f | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(sudo find $directory -name "*.conf" | wc -l)"
echo "Text files = $(sudo find $directory -name "*.txt" | wc -l)"
echo "Executable files = $(sudo find $directory -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(sudo find $directory -name "*.log" | wc -l)"
echo "Archive files = $(sudo find $directory -type f -regex '.*\(zip\|rar\|7z\|tar\)' | wc -l)"
echo "Symbolic links = $(sudo find $directory -type l | wc -l)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
files=`sudo find $directory -type f -exec du -ah {} + | sort -hr | head -n 10`
for ((i=1; i <= 10; i++))
do
  file=`printf "$files" | awk '{print $2}' | awk "NR==$i"`
  size=`printf "$files" | awk '{printf("%sB\n", $1)}' | awk "NR==$i"`
  ftype=`printf "$file" | grep -m 1 -o -E "\.[^\/.]+$" | awk -F . '{print $2}'`
  echo "$i - $file, $size, $ftype"
done
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
execfiles=`sudo find "$directory" -type f -executable -exec du -ah {} + | sort -hr | head -n 10`
for ((i=1; i <= 10; i++))
do
  file=`printf "$execfiles" | awk '{print $2}' | awk "NR==$i"`
  size=`printf "$execfiles" | awk '{printf("%sB\n", $1)}' | awk "NR==$i"`
  md5sum=`md5sum $file | awk '{print $1}'`
  echo "$i - $file, $size, $md5sum"
done

