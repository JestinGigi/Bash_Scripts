#!/bin/bash

# Configuration
backup_folder="/mnt/jenkins-full-backups"
jenkins_home="/var/lib/jenkins"
current_date=$(date +"%Y%m%d-%H%M%S")
error_folder="/home/robotwhh/jenkins-backup-logs"
error_file="${current_date}-jenkins-backup-log.txt"

# Ensure Error Folder exist
mkdir -p "$error_folder" 2>> "$error_folder/$error_file"

# Ensure backup folder exists
mkdir -p "$backup_folder" 2>> "$error_folder/$error_file"

# Archive Jenkins workspace
backup_filename="${current_date}-jenkins-backup.tar.gz"
tar -C $jenkins_home -czf "${backup_folder}/${backup_filename}" . 2>> "$error_folder/$error_file"

# Archieving jenkins with a progress bar (superuser privilege required)
# tar -C "/var/lib/jenkins" -cf - . | pv -p --timer --rate --bytes | gzip > mnt/backups/mybackup.tar.gz"

# Display success message
echo "Jenkins backup created: $backup_folder/$backup_filename"


<<comment
Lines to check the backup max should be 5 
comment