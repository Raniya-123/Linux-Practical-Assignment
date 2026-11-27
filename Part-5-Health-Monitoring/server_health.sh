
#!/bin/bash

{

echo "Date and Time:"
date

echo "Hostname:"
hostname

echo "Root Disk Usage:"
df -h /

echo "Available Memory:"
free -h

echo "System Uptime:"
uptime

echo "Top 5 CPU-consuming Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo "Application Process Check:"
if pgrep -x "$1" > /dev/null
then
    echo "$1 is running"
else
    echo "ALERT: $1 is not running"
fi

echo "Disk Usage Warning:"
usage=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$usage" -gt 80 ]
then
    echo "WARNING: Disk usage is above 80%"
else
    echo "Disk usage is below 80%"
fi

} | tee server_report.txt
