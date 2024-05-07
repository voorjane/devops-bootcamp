#!/bin/bash

function system()
{
echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $(timedatectl | grep "Time zone" | awk '{print $3, $4, $5}')"
echo "USER = $(whoami)"
echo "OS = $(hostnamectl | grep "Operating System" | awk '{print $3, $4, $5}')"
echo "DATE = $(date | awk '{print $3,$2,$6,$4}')"
echo "UPTIME = $(uptime -p | awk '{print $2, $3, $4, $5}')"
echo "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}') seconds"
echo "IP = $(ifconfig | grep "inet" | awk '{print $2;exit}')"
echo "MASK = $(ifconfig | grep "inet" | awk '{print $4;exit}')"
echo "GATEWAY = $(ip route | grep "default" | awk '{print $3;exit}')"
echo "RAM_TOTAL = $(free -m | grep "Mem" | awk '{printf("%.3f\n", $2 / 1024)}') GB"
echo "RAM_USED = $(free -m | grep "Mem" | awk '{printf("%.3f\n", $3 / 1024)}') GB"
echo "RAM_FREE = $(free -m | grep "Mem" | awk '{printf("%.3f\n", $4 / 1024)}') GB"
echo "SPACE_ROOT = $(df / | grep "/" | awk '{printf("%.2f\n", $2 / 1024)}') MB"
echo "SPACE_ROOT_USED = $(df / | grep "/" | awk '{printf("%.2f\n", $3 / 1024)}') MB"
echo "SPACE_ROOT_FREE = $(df / | grep "/" | awk '{printf("%.2f\n", $4 / 1024)}') MB"
}
