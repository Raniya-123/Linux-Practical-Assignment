#!/bin/bash


echo "Enter the directory path:"
read dir

if [ -d "$dir" ]; then


    timestamp=$(date +%Y%m%d_%H%M%S)


    tar -czf "${dir}_backup_${timestamp}.tar.gz" "$dir"


    if [ $? -eq 0 ]; then
        echo "Backup successful"
    else
        echo "Backup failed"
    fi

else
    echo "Directory does not exist"
fi
