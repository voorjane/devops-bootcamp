#!/bin/bash

regex="^[1-6]$"

if ! [ "$#" -eq 4 ]
then
        echo "Script works with 4 parameters. Call the script again with correct ammout of parameters."
	exit 1
elif ! [[ $1 =~ $regex ]] || ! [[ $2 =~ $regex ]] || ! [[ $3 =~ $regex ]] || ! [[ $4 =~ $regex ]]
then
       echo "Parameters for this script are numbers from 1 to 6. Call the script again with correct parameters."
       exit 1
elif [ "$1" = "$2" ] || [ "$3" = "$4" ]
then
        echo "Background and font colors can not be the same color. Call the script again with correct parameters."
        exit 1
fi

