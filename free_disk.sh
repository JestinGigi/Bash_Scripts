#!/bin/bash
set -x
THRESHOLD=20
MAX=100
# user % of root (/)
FREE=$(($MAX - $(df -h | awk '$6 ~ /^\/$/ {print $5}' | tr -d %)))

# Check if used space exceedes threshold
if [[ $FREE -lt $THRESHOLD ]];then
    echo "Warning, disk space very low"
else
    echo "Disk space OK"
fi
