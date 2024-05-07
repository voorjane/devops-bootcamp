FROM nginx

RUN apt update -y; \
    useradd nginx; \
    apt install gcc libfcgi-dev spawn-fcgi -y; \
    chown -R nginx:nginx /home; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /etc/nginx/error.log; \
    chmod 755 usr/bin/chage usr/bin/chfn usr/bin/wall usr/bin/newgrp  \
    usr/bin/mount usr/bin/umount usr/bin/passwd usr/bin/expiry \
    usr/bin/gpasswd usr/sbin/unix_chkpwd usr/bin/chsh usr/bin/su; \
    echo "1" > /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    rm -rf /var/lib/apt/lists

USER nginx

WORKDIR /server

COPY server/server.c .
COPY server/run.sh .
COPY server/nginx/nginx.conf /etc/nginx/

EXPOSE 8080

CMD [ "/bin/bash", "./run.sh" ]

HEALTHCHECK CMD [ "curl --fail http://localhost:80 || exit 1" ]
