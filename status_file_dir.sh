#!/bin/bash

read -p "Path of the directory: " -e file

if [[ -e $file ]];then
	if [[ -f "$file" ]];then
		echo "Path is a file"
	fi

	if [[ -d "$file" ]]; then
		echo "Path is a directory"
	fi

	if [[ -r "$file" ]]; then
		echo "File is readable"
	fi

	if [[ -w "$file" ]]; then
		echo "File is writable"
	fi

	if [[ -x "$file" ]]; then
		echo "File is executable"
	fi
else 
	echo "File/Directory does'nt exist"
	exit 1
fi

exit
