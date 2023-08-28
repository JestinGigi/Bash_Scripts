#!/bin/bash

<<comment 
Monitoring free disk and sending an alert message via mail

Requires setup of postfix and mailutils on ubuntu
comment

set -x
THRESHOLD=50
MAX=100
TO='jestin3008@gmail.com'
# user % of root (/)
FREE=$(($MAX - $(df -h | awk '$6 ~ /^\/$/ {print $5}' | tr -d %)))

# Check if used space exceedes threshold
if [[ $FREE -lt $THRESHOLD ]];then
    echo "Warning, disk space very low $FREE %" | mail -s "Disk Space Low" $TO
else
    echo "Disk space OK"
fi
