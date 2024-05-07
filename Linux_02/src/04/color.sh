#!/bin/bash

column1_background=0
column1_font_color=0
column2_background=0
column2_font_color=0
source config.cfg
source check.sh
COL_TEXT=([0]=37 [1]=37 [2]=31 [3]=32 [4]=34 [5]=35 [6]=30) # 1 - white 2 - red 3 - green
COL_BACK=([0]=40 [1]=47 [2]=41 [3]=42 [4]=44 [5]=45 [6]=40) # 4 - blue 5 - purple 6 - black
SCHEME=([0]='default' [1]='1' [2]='2' [3]='3' [4]='4' [5]='5' [6]='6')
SCHEME_BACK=([0]='Black' [1]='White' [2]='Red' [3]='Green' [4]='Blue' [5]='Purple' [6]='Black')
SCHEME_FRONT=([0]='White' [1]='White' [2]='Red' [3]='Green' [4]='Blue' [5]='Purple' [6]='Black')
COLOR1="\033[${COL_BACK[$column1_background]};${COL_TEXT[$column1_font_color]}m"
COLOR2="\033[${COL_BACK[$column2_background]};${COL_TEXT[$column2_font_color]}m"
DEFAULT="\033[0m"
