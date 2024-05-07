#!/bin/bash

source check.sh
sudo chmod +x info.sh

while sleep 3
do
    ./info.sh
    sudo cp index.html /usr/share/nginx/html/index.html
done
