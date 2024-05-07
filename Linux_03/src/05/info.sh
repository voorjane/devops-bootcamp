#!/bin/bash

for file in 1 2 3 4 5
do
  path="../04/$file.log"
  if [[ $parameter == 1 ]]
  then
    awk -F ' ' '{ print $10, $0 }' "$path" | sort >> sorted_by_code.log
  fi

  if [[ $parameter == 2 ]]
  then
    awk -F ' ' '{ print $1 }' "$path" | sort -nu >> all_uniq_ips.log
  fi

  if [[ $parameter == 3 ]]
  then
    awk -F ' ' '/ 400 / || / 401 / || / 403 / || / 404 / || / 500 / || / 501 / || / 502 / || / 503 / { print $0 }' "$path" >> all_err_codes.log
  fi

  if [[ $parameter == 4 ]]
  then
    bash info.sh 3
    cp all_err_codes.log temp.log
    awk -F ' ' '{ print $1 }' temp.log | sort -nu >> all_uniq_ips_with_err_codes.log
    rm temp.log
  fi
done
