FROM ubuntu

RUN apt update -y; \
    apt install gcc libfcgi-dev spawn-fcgi -y; \
    rm -rf /var/lib/apt/lists

WORKDIR /server

COPY server/server.c .
COPY server/run.sh .

CMD [ "/bin/bash", "./run.sh" ]
