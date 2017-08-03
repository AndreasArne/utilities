#!/bin/bash
echo "Card usage"
du -hs

echo "##################################"
echo "HDD usage"
echo ""
df -h ~/raid

echo "##################################"
echo "RAM usage"
echo ""
free -h

echo "##################################"
echo "CPU usage"
echo ""
mpstat | awk '$13 ~ /[0-9.]+/ { print 100 - $13"%" }'

echo "##################################"
echo "Logged on users"
echo ""
w

echo "##################################"
echo "Temperature"
echo ""
sensors
