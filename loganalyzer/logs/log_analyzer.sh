#!/bin/bash

################################################################################
# This script analyses logs that have updated in the last 24 hours in the current directory. 
# File(s) must have been edited in the last 24 hours for the script to run as appropriately.
# Author: Ayo Adewuyi
# Version: v0.0.1
# Date:05/02/2026
################################################################################

echo "###   Analysing logs   ###"
echo "=========================="

echo -e "\nList of log files updated in the last 24 hours."
find /mnt/c/Users/ME/bash-scripts/loganalyzer/logs -name "*.log" -mtime -1

echo -e "\nSearching ERROR logs in application logs."
grep "ERROR" /mnt/c/Users/ME/bash-scripts/loganalyzer/logs/application.log

echo -e "\nNumber of errors found in application logs."
grep -c "ERROR" /mnt/c/Users/ME/bash-scripts/loganalyzer/logs/application.log

echo -e "\nThe last error in application logs."
grep -c "FATAL" /mnt/c/Users/ME/bash-scripts/loganalyzer/logs/application.log | tail -1

echo -e "\nThe FATAL errors from system logs."
grep "FATAL" /mnt/c/Users/ME/bash-scripts/loganalyzer/logs/system.log

echo -e "\nNumber of FATAL errors in the system log."
grep -c "FATAL" /mnt/c/Users/ME/bash-scripts/loganalyzer/logs/system.log