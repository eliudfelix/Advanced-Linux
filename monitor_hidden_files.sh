#!/bin/bash

# Directories To Monitor And The Output File
DIR_2_MONITOR="/root/etc"
OUTPUT_FILE="/var/log/hidden_files_changes.log"

# Monitor Hidden Files And Root Executables
inotifywait -m -r -e modify,create,delete --format '%w%f %e %T' --timefmt '%F %T'
$DIR_2_MONITOR > $OUTPUT_FILE &

echo "Monitoring Hidden Files And Root Executables. Changes Will Be Logged to $OUTPUT_FILE"
