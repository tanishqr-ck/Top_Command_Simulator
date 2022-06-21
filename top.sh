while :; do
echo "Tanishq Rajput"
echo "2020btcse027"
echo "Linux process"
echo "Total process running : `ls /proc/ | grep "[0-9]" | wc -l`"
printf "%-20s %-20s %-45s %-20s %-20s %-20s %-20s\n" PID User Command Priority CPU% MEM% File_Descriptors 
for pid in `ls /proc/ | grep "[0-9]"`; do
if [[ `cat /proc/$pid/stat | awk '{print $18}'` -gt 0 ]]
then
printf "%-20s %-20s %-45s %-20s %-20s %-20s %-20s\n" $pid `ls -l /proc/$pid/stat | awk '{print $3}'` `cat /proc/$pid/stat | awk '{print $2}'` `cat /proc/$pid/stat | awk '{print $18}'` `ps -o %cpu | head -2 | tail -1` `ps -o %mem | head -2 | tail -1` `sudo ls -l /proc/$pid/fd | wc -l`
fi
done
sleep 1
clear
done