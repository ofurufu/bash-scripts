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
REPORT_FILE="/mnt/c/Users/ME/bash-scripts/loganalyzer/logs/log_analyzer_report.txt"

echo "###   Analysing logs   ###" > "$REPORT_FILE"
echo "==========================" >> "$REPORT_FILE"

echo -e "\nList of log files updated in the last 24 hours." >> "$REPORT_FILE"
LOG_FILES=$(find  $LOG_DIR -name "*.log" -mtime -1) 
echo "$LOG_FILES" >> "$REPORT_FILE"

for LOG_FILE in $LOG_FILES; do
    echo -e "\n" >> "$REPORT_FILE"
    echo "================================================" >> "$REPORT_FILE"
    echo "=============$LOG_FILES=========================" >> "$REPORT_FILE"
    echo "================================================" >> "$REPORT_FILE"

    for PATTERN in ${ERROR_PATTERNS[@]}; do

        echo -e "\nSearching $PATTERN logs in $LOG_FILE file." >> "$REPORT_FILE"
        grep    "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

        echo -e "\nNumber of $ERROR_PATTERN logs found in $LOG_FILE" >> "$REPORT_FILE"
        grep -c "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"
    done
done

echo -e "\nLog Analysis completed and report saved in: $REPORT_FILE"