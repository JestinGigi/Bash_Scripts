#!/bin/bash

month=$(date | awk '{print $2}')
date=$(date | awk '{print $3}')

awk -v month="$month" -v date="$date" '$1 ~ month && $2 ~ date {print $0}' /var/log/auth.log
