#!/bin/bash

################################################################################
# This script analyses logs that have updated in the last 24 hours in the current directory. 
# File(s) must have been edited in the last 24 hours for the script to run as appropriately.
# Author: Ayo Adewuyi
# Version: v0.0.1
# Date:05/02/2026
################################################################################

# Variable Definition
LOG_DIR="/mnt/c/Users/ME/bash-scripts/loganalyzer/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

echo "###   Analysing logs   ###"
echo "=========================="

echo -e "\nList of log files updated in the last 24 hours."
find  $LOG_DIR -name "*.log" -mtime -1

echo -e "\nSearching ERROR logs in application logs."
grep "ERROR" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of errors found in application logs."
grep -c "ERROR" "$LOG_DIR/$APP_LOG_FILE
echo -e "\nThe last error in application logs."
grep -c "FATAL" "$LOG_DIR/$APP_LOG_FILE" | tail -1

echo -e "\nThe FATAL errors from system logs."
grep "FATAL" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nNumber of FATAL errors in the system log."
grep -c "FATAL" "$LOG_DIR/$SYS_LOG_FILE"