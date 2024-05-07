#!/bin/bash

if [[ $column1_background = 0 ]]
then
	echo "Column 1 background = default (Black)"
else
	echo "Column 1 background = ${SCHEME[column1_background]} (${SCHEME_BACK[column1_background]})"
fi

if [[ $column1_font_color = 0 ]]
then
	echo "Column 1 font color = default (White)"
else
	echo "Column 1 font color = ${SCHEME[column1_font_color]} (${SCHEME_FRONT[column1_font_color]})"
fi

if [[ $column2_background = 0 ]]
then
	echo "Column 2 background = default (Black)"
else
	echo "Column 2 background = ${SCHEME[column2_background]} (${SCHEME_BACK[column2_background]})"
fi

if [[ $column2_font_color = 0 ]]
then
	echo "Column 2 font color = default (White)"
else
	echo "Column 2 font color = ${SCHEME[column2_font_color]} (${SCHEME_FRONT[column2_font_color]})"
fi
