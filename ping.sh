#!/bin/bash
cameraip=`cat /home/administrator/ping/cameraIp.txt | wc -l`
if [ $cameraip -gt 0 ]
then
rm -rf /home/administrator/ping/FailedCamera*.log
FILE="/home/administrator/ping/cameraIp.txt"
while read line; do
count=$(ping -c 5 "$line" | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }') 
  if [ $count -eq 0 ]; then
    # 100% failed
failedhosts="$line $CRname"  
echo $failedhosts >> /home/administrator/ping/FailedCamera$CRname.log
else
touch FailedCamera_NotFound.log
fi
done < $FILE
content=`cat /home/administrator/ping/FailedCamera*.log | wc -l`
if [ $content -gt 0 ]
then
else
echo "no"
fi
fi
