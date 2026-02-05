#!/bin/bash

################################################################################
# This script analyses logs that have updated in the last 24 hours in the current directory. 
# File(s) must have been edited in the last 24 hours for the script to run as appropriately.
# Author: Ayo Adewuyi
# Version: v0.0.1
# Date:05/02/2026
################################################################################

# Finding files that were updated in the last 24 hours

find . -name "*.log" -mtime -1

grep "ERROR" application.log
grep -c "ERROR" application.log
grep -c "FATAL" application.log

grep "FATAL" system.log
grep -c "CRITICAL" system.log
grep -c "CRITICAL" system.log