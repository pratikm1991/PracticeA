FILE="/home/administrator/hostcheck/serverip.txt"
while read line; do
sshpass -p '******' ansible -tt $line -f 1 -k -m shell -a 'cat /etc/hosts' >> /home/administrator/hostcheck/hostcheck_output.txt
done < $FILE

