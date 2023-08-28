#!/bin/bash 
touch /home/ubuntu1/scripts/Report.txt
FILE="/home/ubuntu1/scripts/Report.txt"
#Current Date 
DATE=$(date) 
UPTIME=$(uptime)
#Server Ip address 
IP=$(ip -4 a | awk '/inet / {print $2'} | tail -n 1) 
#Hostname 
HOST=$(hostname) 
#Kernal Info 
KERNAL_NAME=$(uname -s) 
KERNAL_RELEASE=$(uname -r) 
KERNAL_VERSION=$(uname -v) 

#CPU Info 
CPU=$(lscpu)

#Free Space
fspace=$(free -h)

#Disk Space
dspace=$(df -h)

python3 -c 'print("-"*100)' > $FILE
echo "Report" >> $FILE
python3 -c 'print("-"*100)' >> $FILE


echo "Date: $DATE" >> $FILE 
echo "Uptime: $UPTIME" >> $FILE
echo "Host: $HOST" >> $FILE
echo "Kernal: $KERNAL_NAME">> $FILE
echo "Relase: $KERNAL_RELEASE">> $FILE
echo "Version: $KERNAL_VERSION">> $FILE
python3 -c 'print("-"*100)' >> $FILE
echo -e "CPU Information\n\n$CPU">> $FILE
python3 -c 'print("-"*100)' >> $FILE
echo -e "Memory Status" >> $FILE
echo -e "$fspace \n\n">> $FILE
python3 -c 'print("-"*100)' >> $FILE
echo -e "Disk Status" >> $FILE
echo "$dspace">> $FILE
python3 -c 'print("-"*100)' >> $FILE
echo -e "Top 5 expensive processes\n" >> $FILE
ps -ao pid,%cpu,%mem,cmd --sort=-%mem | head -5 >> $FILE
