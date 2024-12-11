#!/bin/bash

# Health Monitoring Script

# CPU Usage
echo "CPU Usage:"
top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'

# Memory Usage
echo "Memory Usage:"
free -m

# Disk Usage
echo "Disk Usage:"
df -h

# Running Processes
echo "Running Processes:"
ps aux --sort=%mem | head -n 10

# Save the report
report_file="/home/efelix/health_report.txt"
{
	echo "CPU Usage:"
	top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'
	echo "Memory Usage:"
	free -m
	echo "Disk Usage:"
	df -h
	echo "Running Processes:"
	ps aux --sort=%mem | head -n 10
} > "$report_file"

echo "Health report saved to $report_file"
