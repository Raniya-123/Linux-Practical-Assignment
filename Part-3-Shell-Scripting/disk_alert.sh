
#!/bin/bash


usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')


if [ "$usage" -gt 80 ]; then
    echo "WARNING"
else
    echo "OK"
fi
