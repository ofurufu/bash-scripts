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

# ERROR_PATTERNS
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo "###   Analysing logs   ###"
echo "=========================="

echo -e "\nList of log files updated in the last 24 hours."
LOG_FILES=$(find  $LOG_DIR -name "*.log" -mtime -1)
echo "$LOG_FILES"

for LOG_FILE in $LOG_FILES; do

    for PATTERN in ${ERROR_PATTERNS[@]}; do

        echo -e "\nSearching $PATTERN logs in $LOG_FILE file."
        grep    "$PATTERN" "$LOG_FILE"

        echo -e "\nNumber of $ERROR_PATTERN logs found in $LOG_FILE"
        grep -c "$PATTERN" "$LOG_FILE"
    done
done