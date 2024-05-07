FROM nginx

WORKDIR /server

COPY server/server.c .
COPY server/run.sh .
COPY server/nginx/nginx.conf /etc/nginx/

RUN apt update -y && apt upgrade -y && apt install gcc libfcgi-dev spawn-fcgi -y

EXPOSE 8080

CMD [ "/bin/bash", "./run.sh" ]
