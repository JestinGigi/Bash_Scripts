#!/bin/bash

echo -e "Menu Driven\n1. list files\n2. list directories\n3. Ram Usage\n4. Disk Usage\n"

read -p "Choice: " opt

case "$opt" in
	1)
	ls -lhStp | grep -v /
	;;
	2)
	ls -F | grep /
	;;
	3)
	ps -eo pid,rss --sort=-rss | awk '$2 > 0'
	;;
	4)
	df -h --output=source,avail,target
	;;
esac


	
	


