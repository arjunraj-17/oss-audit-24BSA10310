#!/bin/bash

# 1. Check if a filename was provided as an argument ($1)
if [ -z "$1" ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

LOGFILE=$1
KEYWORD="ERROR"
COUNTER=0

echo "--------------------------------------------------------"
echo "           OSS LOG AUDIT: SEARCHING FOR $KEYWORD        "
echo "--------------------------------------------------------"

# 2. Verify if the file actually exists before reading
if [ ! -f "$LOGFILE" ]; then
    echo "[ERROR]: File '$LOGFILE' not found."
    exit 1
fi

# 3. The While-Read Loop: Processes the file line by line
# This is more memory-efficient than loading the whole file at once
while read -r LINE; do
    # 4. If-Then logic to check if the line contains the keyword
    if echo "$LINE" | grep -q "$KEYWORD"; then
        ((COUNTER++))
        echo "[FOUND]: $LINE"
    fi
done < "$LOGFILE"

# 5. Print the final summary
echo "--------------------------------------------------------"
echo "AUDIT SUMMARY:"
echo "  Total instances of '$KEYWORD' found: $COUNTER"
echo "--------------------------------------------------------"
