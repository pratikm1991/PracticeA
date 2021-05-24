count_pratik=`cat /home/administrator/screenshot/screenshot.sh | grep mail | grep pratik.mohanty | wc -l`
if [ $count_pratik -gt 0 ]; then
echo "Put Pratik ID" >> /home/administrator/screen_update.txt
sed -i 's/pratik.mohanty//g' /home/administrator/screenshot/screenshot.sh
else
echo "Hurreeeyyyy" >> /home/administrator/screen_update.txt
fi
