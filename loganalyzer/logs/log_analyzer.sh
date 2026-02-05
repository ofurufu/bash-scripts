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

echo -e "\n### List of log files updated in the last 24 hours. ###"
find . -name "*.log" -mtime -1

echo -e "\n### Searching ERROR logs in application logs. ###"
grep "ERROR" application.log

echo -e "\n### Number of errors found in application logs. ###"
grep -c "ERROR" application.log

echo -e "\n### The last error in application logs. ###"
grep -c "FATAL" application.log | tail -1

echo -e "\n### The FATAL errors from system logs. ###"
grep "FATAL" system.log

echo -e "\n### Number of FATAL errors in the system log. ###"
grep -c "FATAL" system.log