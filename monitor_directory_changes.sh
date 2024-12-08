#!/bin/bash

# Directory to monitor
MONITORED_DIR="/var/log"
# Hash file to store previous state
HASH_FILE="/var/log/dir_hash.txt"
# Output file for changes
OUTPUT_FILE="/var/log/dir_changes.log"

# Create a hash of the directory
if [ ! -f $HASH_FILE ]; THEN
	find $MONITORED_DIR -type f -exec md5sum {} \; | sort | md5sum > $HASH_FILE
	echo "Initial has created." > $OUTPUT_FILE
else
	# Compare current hash with the previous hash
	CURRENT_HASH=$(find $MONITORED_DIR -type f -exec md5sum {} \; | sort | md5sum)
	PREVIOUS_HASH=$(cat $HASH_FILE)

	if [ "$CURRENT_HASH" != "$PREVIOUS_HASH" ]; then
		echo "Changes detected in $MONITORED_DIR on $(date)" >> $OUTPUT_FILE
		find $MONITORED_DIR -type f -exec md5sum {} \; >> $OUTPUT_FILE
		echo "$CURRENT_HASH" > $HASH_FILE
	fi
fi
