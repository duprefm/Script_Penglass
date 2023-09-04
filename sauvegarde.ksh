#!/bin/ksh

# Define the backup timestamp 
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Define the number of days
BACKUP_DAYS=1

# Define the source directory 
SOURCE_DIR="/Users/fabricedupre/Desktop/Script_Piertre/source" 
# Define the output tarball name and location
OUTPUT_DIR="/Users/fabricedupre/Desktop/Script_Piertre/output"
OUTPUT_TAR="$OUTPUT_DIR/backup-$TIMESTAMP.tar.gz"

# Create a tarball and compress it 
tar -czvf "$OUTPUT_TAR" "$SOURCE_DIR" 
echo "Backup completed: $OUTPUT_TAR"

# Find and delete backups older than 1 month 
#find "$OUTPUT_DIR/backup-$TIMESTAMP.tar.gz" -type f -mtime +$BACKUP_DAYS -exec rm -f {} \;
find "$OUTPUT_DIR/backup-$TIMESTAMP.tar.gz" -type f -mtime +$BACKUP_DAYS -delete
echo "Backup completed and old backups deleted."