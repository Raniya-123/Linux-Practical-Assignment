#!/bin/bash

# Display hostname
echo "Hostname:"
hostname

# Display uptime
echo "Uptime:"
uptime

# Display memory usage
echo "Memory Usage:"
free -h

# Display top 5 CPU-consuming processes
echo "Top 5 CPU-consuming Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
