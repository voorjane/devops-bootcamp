#!/bin/bash

source check.sh
source check_space.sh

if [[ $space == "less than 1Gb" ]]
then
  echo "There is less than 1Gb on your disk. Please clean your disk before executing the script" ; exit 1
fi

source create.sh
