#!/bin/bash
if [ -f /tmp/rsyncLock ] ; then
 echo "rsync already running"
else
 touch /tmp/rsyncLock
 ipaddr=$1
# rsync -vr --chmod=755 --append -e "ssh -o StrictHostKeyChecking=no" --exclude="tmp/" --exclude="embedded/" --exclude="thumbnails/*" --exclude="thumbnails" /download1/ administrator@$ipaddr:/download1/ >> /home/administrator/nuc2server.log

 (echo '0$c!ent' ) | sshpass -p '0$c!ent' rsync -vr --chmod=755 --append -e "ssh  -o StrictHostKeyChecking=no" --exclude="tmp/" --exclude="embedded/" --exclude="thumbnails/*" --exclude="thumbnails" /download1/ administrator@$ipaddr:/download1/ >> /home/administrator/nuc2server.log

 rm /tmp/rsyncLock
fi
