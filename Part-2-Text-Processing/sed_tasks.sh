#!/bin/bash

sed 's/ERROR/CRITICAL/g' "$HOME/server.log" > output/server_critical.log
