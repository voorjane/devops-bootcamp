#!/bin/bash

COL_TEXT=([1]=37 [2]=31 [3]=32 [4]=34 [5]=35 [6]=30) # 1 - white 2 - red 3 - green
COL_BACK=([1]=47 [2]=41 [3]=42 [4]=44 [5]=45 [6]=40) # 4 - blue 5 - purple 6 - black
COLOR1="\033[${COL_BACK[$1]};${COL_TEXT[$2]}m"
COLOR2="\033[${COL_BACK[$3]};${COL_TEXT[$4]}m"
DEFAULT="\033[0m"
