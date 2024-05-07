#!/bin/bash

regex="^[0-6]$"
if ! [ "$#" -eq 0 ]
then
        echo "Script works without any parameters."
        exit 1
elif ! [[ $column1_background =~ $regex ]] || ! [[ $column1_font_color =~ $regex ]] || ! [[ $column2_background =~ $regex ]] || ! [[ $column2_font_color =~ $regex ]]
then
       echo "Parameters for this script are numbers from 1 to 6. Call the script again with correct parameters"
       exit 1
elif [[ $column1_background = $column1_font_color ]] || [[ $column2_background = $column2_font_color ]] 
then
	echo "Background and font colors can not be the same color. Call the script again with correct parameters."
	exit 1
elif [[ $column1_background -eq 0 ]] && [[ $column1_font_color -eq 6 ]]
then
	echo "Default and config settings have matching colors. Call the script again with correct parameters."
	exit 1
elif [[ $column1_background -eq 1 ]] && [[ $column1_font_color -eq 0 ]]
then
        echo "Default and config settings have matching colors. Call the script again with correct parameters."
        exit 1
elif [[ $column2_background -eq 0 ]] && [[ $column2_font_color -eq 6 ]]
then
        echo "Default and config settings have matching colors. Call the script again with correct parameters."
        exit 1
elif [[ $column2_background -eq 1 ]] && [[ $column2_font_color -eq 0 ]]
then
        echo "Default and config settings have matching colors. Call the script again with correct parameters."
        exit 1
fi

