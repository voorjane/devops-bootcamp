#!/bin/bash

inputFile="logfile.log"
sudo touch $inputFile
folder=$folders_chars
folderRand="$(compgen -d / | shuf -n1)"
fileExt=$(echo "$files_chars" | awk -F. '{print $2}')
lastNameFolder=${folders_chars: -1}
fileName=$(echo "$files_chars" | awk -F. '{print $1}')
oldName=$fileName
lastNameFiles=${fileName: -1}
logDate="$(date +"%d%m%y")"
newDate="$(date +"%d.%m.%y")"
count=$(( $RANDOM % 100 + 1 ))

if [[ ${#folder} -lt 5 ]]; then
    for (( i=${#folder}; i<5; i++ )); do
        folder+="$lastNameFolder"
    done
fi

for (( i=1; i<=$count; i++ )); do
    folderRand="$(compgen -d / | shuf -n1 )"
    filesCounter="$(shuf -i 1-50 -n1)"
    if [[ $folderRand == "/bin" || $folderRand == "/sbin" || $folderRand == "/root" ||  $folderRand == "/proc" || $folderRand == "/sys" ]]; then
        count++
        continue
    fi
    sudo mkdir -p "$folderRand"/"$folder"/"$logDate" 2>/dev/null
    for (( j=1; j<=${filesCounter}; j++ )); do
        echo "Filled $i/${count} roots and created $j/${filesCounter} files"
        avelSize="$(df -h / | awk '{print $4}' | tail -n1)"
        if [[ ${avelSize: -1} == "M" ]]; then
            echo "Error: no space!"
            exit
        fi
        sudo fallocate -l "$filesize" "$folderRand/${folder}_$logDate/${fileName}_$logDate.$fileExt" 2>/dev/null
        line="File created: $newDate | $folderRand/${folder}_$logDate/${fileName}_$logDate.$fileExt | File size is = ${filesize} Mb."
        echo "$line" | sudo tee -a $inputFile
        fileName+="$lastNameFiles"
    done
    fileName=$oldName
    folder+="$lastNameFolder"
done
