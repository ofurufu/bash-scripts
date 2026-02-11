# Log Analyzer

A small Bash script that scans log files modified in the last 24 hours and produces a summary report.

**Author:** Ayo Adewuyi

**Version:** v0.0.1 — 05/02/2026

**Location:** logs/log_analyzer.sh

**Overview**
- **Description:** The script searches for log files updated in the last 24 hours, extracts lines matching common error patterns (ERROR, FATAL, CRITICAL), and writes a human-readable report to `logs/log_analyzer_report.txt`.

**Prerequisites**
- Bash (Linux, macOS, or WSL on Windows)
- Standard GNU utilities: `find`, `grep`, `chmod`

**Default paths (as shipped)**
- Log directory: `/mnt/c/Users/ME/bash-scripts/loganalyzer/logs`
- Report file: `/mnt/c/Users/ME/bash-scripts/loganalyzer/logs/log_analyzer_report.txt`

These are defined near the top of the script; edit them in `logs/log_analyzer.sh` if you need different locations.

**Install / Run**
1. Make the script executable:

```bash
chmod +x logs/log_analyzer.sh
```

2. Run the script from the repository root:

```bash
./logs/log_analyzer.sh
```

Or run it directly by path:

```bash
bash logs/log_analyzer.sh
```

**Output**
- The script overwrites `logs/log_analyzer_report.txt` with the analysis. Open that file to view the report.

**Example**

After running:

```bash
./logs/log_analyzer.sh
```

Check the report:

```bash
less logs/log_analyzer_report.txt
```

**Notes & Known Issues**
- The script contains a few small issues you may want to fix:
  - A debug/echo line references an undefined variable (`$ERROR_PATTERN`) instead of the current pattern variable — this will show an empty name in that line.
  - The header prints the whole `LOG_FILES` list where the intent was likely to print the currently-processed `LOG_FILE`.
  - Warning messages for high-error counts are printed to stdout instead of being logged to the report file.

**Suggested improvements**
- Add CLI flags for `--log-dir`, `--output`, and `--threshold`.
- Fix the variable name bugs mentioned above and redirect warnings into the report.
- Add unit-like tests or a dry-run mode for safety.

**License & Contact**
- No license declared. Contact the script author (header) for reuse or contributions.
