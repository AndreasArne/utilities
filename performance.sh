#!/bin/bash
echo "Card usage"
du -hs

echo "##################################"
echo "HDD usage"
df -h ~/hdd1

echo "##################################"
echo "RAM usage"
free -h

echo "##################################"
echo "CPU usage"
mpstat | awk '$12 ~ /[0-9.]+/ { print 100 - $12"%" }'

echo "##################################"
echo "Logged on users"
w

