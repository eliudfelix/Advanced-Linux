#!/bin/bash
# Script to backup important directories and compress them
#
# Define Important Directories That Contain Critical System and User Data
IMPORTANT_DIR="/etc /home /var/log"
BACKUP_DIR="/var/backups/important_backups"
mkdir -p $BACKUP_DIR

# Create a Compressed Backup
date=$(date +"%Y%m%d%H%M")
tar -czf $BACKUP_DIR/backup_$date.tar.gz $IMPORTANT_DIR
