#!/bin/bash

gcc -o server server.c -pthread -lfcgi
spawn-fcgi -p 81 -n ./server
