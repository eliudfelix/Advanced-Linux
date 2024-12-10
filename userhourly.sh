#!/bin/bash
## Script to take a snapshot of the /etc/passwd file and log changes
#
SNAPSHOT_DIR="/var/log/user_snaphots"
CURRENT_SNAPSHOT="$SNAPSHOT_DIR/current_snapshot"
PREVIOUS_SNAPSHOT="$SNAPSHOT_DIR/previous_snapshot"
LOG_FILE="/var/log/user_change_log.txt"

mkdir -p $SNAPSHOT_DIR

if [ -f $CURRENT_SNAPSHOT ]; then
	mv $CURRENT_SNAPSHOT $PREVIOUS_SNAPSHOT
fi

cp /etc/passwd $CURRENT_SNAPSHOT

if [ -f $PREVIOUS_SNAPSHOT ]; then
	DIFF_OUTPUT=$(diff $PREVIOUS_SNAPSHOT $CURENT_SNAPSHOT)
	IF [ "$DIFF_OUTPUT" != "" ]; then
		echo -e "$(date): User changes detected:\n$DIFF_OUTPUT" >> $LOG_FILE
	fi
fi	
