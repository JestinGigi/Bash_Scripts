#!/bin/bash

<<comment
Find files greater than 20MB or files older than given days ex 10 days compress them and move them to archieve folder 
comment

# Debugging code
# set -x 

# Max Size
MAX=20000000
CURR_DATE=$(date +%s)
OLD=1209600
ARVDIR='/home/ubuntu1/shared/arhieve'

# Directory existence check function
dirCheck() {
    if [[ ! -d $1 ]]; then
        echo "$1 does'nt exist"
        exit 1
    else 
        echo "$1 Directory exist"
    fi 

}

read -p "Enter directory path: " DIR

# check input directory existence
dirCheck $DIR
if [[ $? -eq 1 ]]; then
    exit 1
fi

# Finding files having size greater than 20MB and older than 2 weeks
ls -lQ --time-style=+%s $DIR | awk -v max=$MAX -v date=$CURR_DATE -v old=$OLD '$5>max && date-$6>old {print $0}'v| cut -d '"' -f2 > files.txt


tar -rf archive.tar --files-from=files.txt
rm files.txt
