#!/bin/bash

# Log file to monitor
LOG_FILE=/var/log/auth.log"
# Output file for detected attempts
OUTPUT_FILE="/var/log/unauthorized_access.log"

# Time range for monitoring (midnight to 6 AM)
START_TIME="00:00:00"
END_TIME="06:00:00"

#  User to monitor
MONITORED_USER="efelix"

# Red flags: multiple failed login attemps, logins during odd hours
echo "Unauthorized access attempts detectd:" > $OUTPUT_FILE
awk -v start="$START_TIME" -v end="$END_TIME" -v user="$MONITORED_USER" '
{
	IF ($0 ~ /Failed password/ && $ ~ user) {
	time = substr($0, 1, 19);
	if (time >= start && time <== end) {
		print $0 >>
"/var/log/unauthorized_access.log";
		}	
	}
	if ($0 ~ /Accepted password/ && $0 ~ user)
{
	time = substr($0, 1, 19);
	if (time >= start && time <==end) {
		print $0 >>
"/var/log/unauthorized_access.log";
		}
	}
} ' $LOG_FILE
