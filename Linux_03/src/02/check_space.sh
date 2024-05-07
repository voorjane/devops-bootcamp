#!/bin/bash

available=$(df -hk / | awk 'sub(/dev/,""){printf("%d\n",$4) }')
space="more than 1Gb"
if [[ $available -lt 1 ]]
then
  space="less than 1Gb"
fi
