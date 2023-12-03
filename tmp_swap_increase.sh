sudo mount -o remount,size=2G /tmp

sudo dd if=/dev/zero of=/swapfile bs=1M count=1024

chmod 0600 /swapfile

sudo mkswap /swapfile

swapon -a /swapfile

