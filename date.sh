#!/bin/bash
set -x
echo "Today is: " `date`

read -p "Path to directory and files: " the_path

echo -e "Your path contains followings files and directories"
ls $the_path
