#!/bin/bash


echo "Enter the log file path:"
read logfile


if [ -f "$logfile" ]; then

    
    error_count=$(grep -c "ERROR" "$logfile")
    warning_count=$(grep -c "WARNING" "$logfile")
    info_count=$(grep -c "INFO" "$logfile")

    
    echo "ERROR: $error_count"
    echo "WARNING: $warning_count"
    echo "INFO: $info_count"


    if [ "$error_count" -gt 3 ]; then
        echo "ALERT: Too many errors"
    else
        echo "OK"
    fi

else
    echo "Log file does not exist"
fi
