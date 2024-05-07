# DO5_SimpleDocker Report

## Contents

1. [Ready-made docker](#part-1-ready-made-docker)
2. [Operations with container](#part-2-operations-with-container)
3. [Mini web-server](#part-3-mini-web-server) 
4. [Your own docker](#part-4-your-own-docker)
5. [Dockle](#part-5-dockle)
6. [Basic Docker Compose](#part-6-basic-docker-compose)

## Part 1. Ready-made docker

![dockerpullimages](../misc/screenshots/part1_0.png) \
*`docker pull` and `docker images` output*

![dockerrunps](../misc/screenshots/part1_1.png) \
*`docker run` and `docker ps` output*

![dockerinspect0](../misc/screenshots/part1_2.png) \
![dockerinspect1](../misc/screenshots/part1_3.png) \
![dockerinspect2](../misc/screenshots/part1_4.png) \
![dockerinspect3](../misc/screenshots/part1_5.png) \
![dockerinspect4](../misc/screenshots/part1_6.png) \
![dockerinspect5](../misc/screenshots/part1_7.png) \
*`docker inspect` output*

> Container size - 1.09 kB (virtual 192 MB) \
> List of mapped ports - 80/tcp \
> Container ip - 172.17.0.2 

Found via:
![dockerinspectsize](../misc/screenshots/part1_8.png) \
*container size*

![dockerpssize](../misc/screenshots/part1_15.png)
*also container size*

![dockerinspectports](../misc/screenshots/part1_9.png) \
*mapped ports*

![dockerinspectip](../misc/screenshots/part1_10.png) \
*container ip*

![dockerstopps](../misc/screenshots/part1_11.png) \
*`docker stop` and `docker ps` output*

![dockerruncurl](../misc/screenshots/part1_12.png) \
*`docker run` on 80 and 443 ports and `localhost:80` page*

![browser](../misc/screenshots/part1_13.png) \
*`localhost:80` page in browser*

![dockerrestart](../misc/screenshots/part1_14.png) \
*`docker restart` output, container restarted*

## Part 2. Operations with container

![catconf](../misc/screenshots/part2_0.png) \
*`nginx.conf` contains*

![nginxconf](../misc/screenshots/part2_1.png) \
*`nginx.conf` created on local machine* 

![dockercp](../misc/screenshots/part2_2.png) \
*conig copied inside the container, `nginx` reloaded, and now we can see `localhost:80/status` page*

![browser2](../misc/screenshots/part2_3.png) \
*`localhost:80/status` in browser*

![dockerexport](../misc/screenshots/part2_4.png) \
*container exported in `container.tar`, container stopped*

![dockerrmi](../misc/screenshots/part2_5.png) \
*image removed, containers still exist*

![dockerrm](../misc/screenshots/part2_6.png) \
*containers deleted (i ran two)*

![dockerimport](../misc/screenshots/part2_7.png) \
*image imported, container started, everything works*

## Part 3. Mini web server

I created a new container for this task and downloaded everything that is needed using:
> `apt update && apt upgrade` \
> `apt install -y gcc libfcgi-dev spawn-fcgi`

Then i made a directory "server" inside the container and copied server.c and nginx.conf using:

> `docker exec f5765b7a3151 mkdir server` \
> `docker cp docker cp server.c f5765b7a3151:server` \
> `docker cp nginx/nginx.conf f5765b7a3151:/etc/nginx/`

Then i compiled server code and used spawn-fcgi:

> `docker exec f5765b7a3151 gcc -o server server/server.c -lfcgi` \
> `docker exec f5765b7a3151 spawn-fcgi -p8080 ./server` \
> `nginx -s reload`

![webserver](../misc/screenshots/part3_0.png) \
*everything works fine*

## Part 4. Your own docker

I made a Dockerfile (04/Dockerfile), copied server source code and nginx config.

Then i wrote a script that container will use to run the server.

Also i wrote a script to build an image and container.

![mydocker](../misc/screenshots/part4_0.png)
*result*

## Part 5. Dockle

I copied everything from `04/` folder and launched `dockle`. I got an error:

![fisrterror](../misc/screenshots/part5_0.png)
*first error*

It can be fixed by running container as so:

`docker run --rm -v /var/run/docker.sock:/var/run/docker.sock IMAGE`

![runcontfix](../misc/screenshots/part5_1.png)
*how to avoid this error*

So now we can see real errors and warnings:

![errwarn](../misc/screenshots/part5_2.png)
![info](../misc/screenshots/part5_3.png)
*errors, warnings, info*

After fixing all errors, dockle outputs nothing now:

![fixed](../misc/screenshots/part5_4.png)
*image is fine now*

![serverworks5](../misc/screenshots/part5_5.png)
*server works like in part 4*

## Part 6. Basic Docker Compose

Similar to Task 5, i copied everything from `05/` folder and created `docker-compose.yml' file.

I edited Dockerfile, run script and nginx config to match the task's requirements.

Then i build it using `docker-compose build` and started using `docker-compose up`.

![dockercompose](../misc/screenshots/part6_0.png)
*`docker-compose` builded and started*

![serverworks6](../misc/screenshots/part6_1.png)
*`curl` output, server works fine*

> ty for review <3