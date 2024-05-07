#!/bin/bash

if [[ $parameter == 1 ]]
then
  echo "Deletion by log file..."
  if ! [[ -f "../02/logfile.log" ]]
  then
    echo "No log file found" ; exit 1
  fi
  file="$(cat ../02/logfile.log | grep "|" | awk '{print $3}')"
  for i in $file;
  do
    sudo rm -rf "$i"
  done
  echo "Done!"
fi

if [[ $parameter == 2 ]]
then
  echo "Enter >DATE< >TIME< For example: >YYYY-MM-DD HH:MM<"
  read srcDate srcTime
  echo "Enter >DATE< >TIME< For example: >YYYY-MM-DD HH:MM<"
  read dstDate dstTime
  sudo rm -rf "$(find / -newermt "$srcDate $srcTime" -not -newermt "$dstDate $dstTime+1" 2>/dev/null)" 2>/dev/null
fi

if [[ $parameter == 3 ]]
then
  echo "Enter mask (date). For example: 010923"
  read mask
  sudo find / -path "*$mask" -delete
fi
