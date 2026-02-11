#!/usr/bin/env bash

################################################################################
# log_analyzer.sh
# Scans log files modified in the last 24 hours and writes an analysis report.
# Author: Ayo Adewuyi (updated)
# Version: v0.0.2
# Date: 05/02/2026
################################################################################

set -o pipefail

usage() {
    cat <<EOF
Usage: $0 [LOG_DIR] [REPORT_FILE] [THRESHOLD]

LOG_DIR    Directory containing logs (default: /mnt/c/Users/ME/bash-scripts/loganalyzer/logs)
REPORT_FILE Path to write report (default: LOG_DIR/log_analyzer_report.txt)
THRESHOLD  Integer threshold for warning (default: 10)
EOF
}

LOG_DIR="${1:-/mnt/c/Users/ME/bash-scripts/loganalyzer/logs}"
REPORT_FILE="${2:-$LOG_DIR/log_analyzer_report.txt}"
THRESHOLD="${3:-10}"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
    usage
    exit 0
fi

mkdir -p "${LOG_DIR}" || {
    echo "Error: cannot access or create log directory: $LOG_DIR" >&2
    exit 2
}

# Begin report
{
    printf '###   Analysing logs   ###\n'
    printf '==========================\n'
    printf '\nList of log files updated in the last 24 hours.\n'
} > "$REPORT_FILE"

# Find files modified in last 24 hours. Use -print0 to safely handle spaces/newlines.
mapfile -d '' -t LOG_FILES < <(find "$LOG_DIR" -maxdepth 1 -type f -name '*.log' -mtime -1 -print0)

if [ ${#LOG_FILES[@]} -eq 0 ]; then
    printf '\nNo log files found in %s modified in the last 24 hours.\n' "$LOG_DIR" >> "$REPORT_FILE"
    printf '\nLog Analysis completed and report saved in: %s\n' "$REPORT_FILE"
    exit 0
fi

# Write list of files
for f in "${LOG_FILES[@]}"; do
    printf '%s\n' "$f" >> "$REPORT_FILE"
done

for LOG_FILE in "${LOG_FILES[@]}"; do
    {
        printf '\n\n================================================\n'
        printf 'Processing: %s\n' "$LOG_FILE"
        printf '================================================\n'
    } >> "$REPORT_FILE"

    for PATTERN in "${ERROR_PATTERNS[@]}"; do
        {
            printf '\nSearching for pattern: %s\n' "$PATTERN"
            # Print matching lines (if any)
            grep -F -- "$PATTERN" "$LOG_FILE" || true
            # Count matches
            ERROR_COUNT=$(grep -F -c -- "$PATTERN" "$LOG_FILE" || true)
            printf '\nNumber of %s logs found in %s: %s\n' "$PATTERN" "$LOG_FILE" "$ERROR_COUNT"
            if [ "${ERROR_COUNT:-0}" -gt "$THRESHOLD" ]; then
                printf '⚠ Action required: Too many %s issues in log file (>%s)\n' "$PATTERN" "$THRESHOLD"
            fi
        } >> "$REPORT_FILE"
    done
done

printf '\nLog Analysis completed and report saved in: %s\n' "$REPORT_FILE"

exit 0