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

# ERROR_PATTERNS
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo "###   Analysing logs   ###"
echo "=========================="

echo -e "\nList of log files updated in the last 24 hours."
find  $LOG_DIR -name "*.log" -mtime -1

echo -e "\nSearching ERROR logs in application.log file."
grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of ERROR logs found in application.log"
grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of FATAL logs found in application.log"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of FATAL logs found in application.log"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of CRIRITAL logs found in $SYS_LOG_FILE."
grep -c "${ERROR_PATTERNS[2]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nCRITICAL logs in the $SYS_LOG_FILE file"
grep -c "${ERROR_PATTERNS[2]}" "$LOG_DIR/$SYS_LOG_FILE"