#!/bin/bash

docker build -t voorjane/server:1.0 .
image_id=`docker images | grep voorjane/server | awk {'print $3'}`
docker run --mount type=bind,source="$(pwd)"/server/nginx,target=/etc/nginx -d -p 80:81 $image_id
docker ps
