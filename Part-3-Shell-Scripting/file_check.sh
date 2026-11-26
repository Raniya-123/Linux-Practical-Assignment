#!/bin/bash

echo "Enter the filepath:"
read filepath
if [ -e "$filepath" ]; then
    echo "File exists"

    if [ -r "$filepath" ]; then
        echo "File is readable"
    else
        echo "File is not readable"
    fi

    if [ -w "$filepath" ]; then
        echo "File is writable"
    else
        echo "File is not writable"
    fi

else
    echo "File does not exist"
fi
