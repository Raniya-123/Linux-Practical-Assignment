#!/bin/bash

cut -d ',' -f 2,3 employees.txt

awk -F ',' '$4 > 40000' employees.txt

cut -d ',' -f 3 employees.txt | sort | uniq -c

sort -t ',' -k4,4nr employees.txt | head -n 1

sort -t ',' -k4,4n employees.txt
