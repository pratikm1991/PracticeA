#!/bin/bash
COUNT=4
for myHost in $HOSTS
do
count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
if [ $count -eq 0 ]; then
# 100% failed
echo "Server failed at $(date)" | mail -s "URGENT | RANDOM APP VPN Server Down" -a FROM:RANDOM-SERVER-PING-Alert@abc.com -a CC: -a Reply-to:
echo "Host : $myHost is up (ping failed) at $(date)"
fi
done

