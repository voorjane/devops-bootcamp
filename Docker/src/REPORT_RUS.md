# Отчёт по DO5_SimpleDocker

## Содержание

1. [Готовый докер](#part-1-готовый-докер)
2. [Операции с контейнером](#part-2-операции-с-контейнером)
3. [Мини веб-сервер](#part-3-мини-веб-сервер) 
4. [Свой докер](#part-4-свой-докер)
5. [Dockle](#part-5-dockle)
6. [Базовый Docker Compose](#part-6-базовый-docker-compose)

## Part 1. Готовый докер

![dockerpullimages](../misc/screenshots/part1_0.png) \
*вывод `docker pull` и `docker images`*

![dockerrunps](../misc/screenshots/part1_1.png) \
*вывод `docker run` и `docker ps`*

![dockerinspect0](../misc/screenshots/part1_2.png) \
![dockerinspect1](../misc/screenshots/part1_3.png) \
![dockerinspect2](../misc/screenshots/part1_4.png) \
![dockerinspect3](../misc/screenshots/part1_5.png) \
![dockerinspect4](../misc/screenshots/part1_6.png) \
![dockerinspect5](../misc/screenshots/part1_7.png) \
*вывод `docker inspect`*

> Размер контейнера - 1.09 kB (виртуально 192 MB) \
> Список замапленных портов - 80/tcp \
> Ip контейнера - 172.17.0.2 

Нашел через:
![dockerinspectsize](../misc/screenshots/part1_8.png) \
*размер контейнера*

![dockerpssize](../misc/screenshots/part1_15.png)
*еще размер контейнера*

![dockerinspectports](../misc/screenshots/part1_9.png) \
*список замапленных портов*

![dockerinspectip](../misc/screenshots/part1_10.png) \
*ip контейнера*

![dockerstopps](../misc/screenshots/part1_11.png) \
*вывод `docker stop` и `docker ps`*

![dockerruncurl](../misc/screenshots/part1_12.png) \
*`docker run` на портах 80 и 443, страница `localhost:80`*

![browser](../misc/screenshots/part1_13.png) \
*страница `localhost:80` в браузере*

![dockerrestart](../misc/screenshots/part1_13.png) \
*вывод `docker restart`, контейнер перезапущен*

## Part 2. Операции с контейнером

![catconf](../misc/screenshots/part2_0.png) \
*содержимое `nginx.conf`*

![nginxconf](../misc/screenshots/part2_1.png) \
*создан `nginx.conf` на локальной машине* 

![dockercp](../misc/screenshots/part2_2.png) \
*конфиг скопирован внутрь контейнера, `nginx` перезапущен, теперь мы можем увидеть страницу `localhost:80/status`*

![browser2](../misc/screenshots/part2_3.png) \
*страница `localhost:80/status` в браузере*

![dockerexport](../misc/screenshots/part2_4.png) \
*экспорт контейнера в `container.tar`, контейнер остановлен*

![dockerrmi](../misc/screenshots/part2_5.png) \
*образ удалён, контейнеры все ещё есть*

![dockerrm](../misc/screenshots/part2_6.png) \
*контейнеры удалены*

![dockerimport](../misc/screenshots/part2_7.png) \
*образ импортирован, контейнер запущен, всё работает*

## Part 3. Мини веб-сервер

Я создал новый контейнер для этого задания и установил все необходимое через:
> `apt update && apt upgrade` \
> `apt install -y gcc libfcgi-dev spawn-fcgi` 

Затем я создал папку "server" внутри контейнера и скопировал файлы server.c и nginx.conf внутрь папки:
> `docker exec f5765b7a3151 mkdir server` \
> `docker cp docker cp server.c f5765b7a3151:server` \
> `docker cp nginx/nginx.conf f5765b7a3151:/etc/nginx/` 

Затем я скомпилировал код сервера и запустил spawn-fcgi:

> `docker exec f5765b7a3151 gcc -o server server/server.c -lfcgi` \
> `docker exec f5765b7a3151 spawn-fcgi -p8080 ./server` \
> `nginx -s reload`

![webserver](../misc/screenshots/part3_0.png) \
*сервер работает*

## Part 4. Свой докер

Я создал Dockerfile (04/Dockerfile), скопировал код сервера и конфиг nginx внутрь папки.

Затем я написал скрипт, который контейнер будет запускать после сборки, чтобы запустить сервер.

Еще я написал скрипт, который собирает образ и запускает контейнер(было необязательно).

![mydocker](../misc/screenshots/part4_0.png)
*результат*

## Part 5. Dockle

Я скопировал все из папки `04/` и запустил `dockle`. Получил ошибку:

![fisrterror](../misc/screenshots/part5_0.png)
*первая ошибка*

Её можно исправить создав контейнер с этими параметрами:

`docker run --rm -v /var/run/docker.sock:/var/run/docker.sock IMAGE`

![runcontfix](../misc/screenshots/part5_1.png)
*как избежать эту ошибку*

Теперь мы видим реальные ошибки и предупреждения:

![errwarn](../misc/screenshots/part5_2.png)
![info](../misc/screenshots/part5_3.png)
*ошибки, предупреждения, информация*

После исправления, dockle ничего не выводит, значит ошибок нет:

![fixed](../misc/screenshots/part5_4.png)
*теперь все ок*

![serverworks5](../misc/screenshots/part5_5.png)
*сервер работает идентично part 4*

## Part 6. Базовый Docker Compose

Аналогично Task 5, я скопировал все из папки `05/` и создал файл `docker-compose.yml'.

Отредактировал Dockerfile, скрипт run.sh и конфиг nginx под требования задания.

Затем я собрал все через `docker-compose build` и запустил через `docker-compose up`.

![dockercompose](../misc/screenshots/part6_0.png)
*`docker-compose` собрался и запустился*

![serverworks6](../misc/screenshots/part6_1.png)
*вывод `curl`, сервер работает*

> ty for review <3