#!/bin/bash

counter_to_repeat=1
date=$(date +"%d%m%y")
full_date=$(date +"%d-%m-%Y")

for (( i=0; i<folders_count; ++i ))
do
  file_counter_to_repeat=1
  folder_name=""
  file_name=""
  if [[ $available -lt 1 ]]
  then
    echo "There is less than 1Gb left on your disk" ; exit 1
  fi
  for (( j=0; j<=${#folders_chars}; ++j ))
  do
    last_char="${folder_name: -1}"
    current_char="${folders_chars: j:1}"
    if [[ $last_char != "$current_char" ]]
    then
      for (( k=0; k<counter_to_repeat; ++k ))
      do
        folder_name+=$current_char;
      done
    fi
  done
  folder_name+="_"
  folder_name+=$date
  mkdir "$path"/"$folder_name"
  echo "Created folder $path/$folder_name/ - $full_date - $(du -h "$path"/"$folder_name"/ | awk '{print $1}')" >> logfile.log
  for (( files=1; files<="$files_count"; files++))
  do
    file_name=""
    if [[ $available -lt 1 ]]
      then
        echo "There is less than 1Gb left on your disk" ; exit 1
    fi
    for (( j=0; j<=${#file_chars}; ++j ))
      do
        file_last_char="${file_name: -1}"
        file_current_char="${file_chars: j:1}"
        if [[ $file_last_char != "$file_current_char" ]]
        then
          for (( k=0; k<file_counter_to_repeat; ++k ))
          do
            file_name+=$file_current_char;
          done
        fi
      done
    file_full_name=$file_name"_"$date"."$file_extension
    sudo touch "$path"/"$folder_name"/"$file_full_name"
    sudo truncate -s "$filesize"K "$path"/"$folder_name"/"$file_full_name"
    echo "Created file $folder_name/$file_full_name - $full_date - ${filesize} Kb" >> logfile.log
    ((++file_counter_to_repeat))
  done
  ((++counter_to_repeat))
done
