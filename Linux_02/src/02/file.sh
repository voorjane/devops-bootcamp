#!/bin/bash

filename=$(date +"%d_%m_%Y_%H_%M_%S".status)
read -p "Do you wish to save system status in a file? [Yy/Nn]" yn
case $yn in
    [Yy]* ) system > "$filename";;
    * ) exit 0;; 
esac
