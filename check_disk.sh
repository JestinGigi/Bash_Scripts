# Program to check if checking if disk size is below threshold
MAX=50

# Available File Systems
df -h | awk 'BEGIN {print "File_System\t\t\tMounted\n"}NR>1{print  $1"\t\t\t\t" $6}'

# Mounted path
MOUNTED=$(echo -e "\nEnter mounted path: ")

# Get available size of mounted path
PROCESS=$(df -h | grep $MOUNTED | python3 -c "import sys; data=sys.stdin.read(); print(data.split()[4][:-1])")

# Check condition for file size
if [[ $PROCESS -gt $MAX ]];then
	echo -e "File size exceeded"
else
	echo -e "File size in the range"
fi

