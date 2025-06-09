#!/bin/bash
set -e

# Verify if the Comet Backup folder exists
if [ -d /opt/CometBackup ]; then
    echo "/opt/CometBackup is not empty"
    if [ ! -f /root/.config/backup-tool/config.dat ]; then
        echo "/root/.config/backup-tool/config.dat is missing!"
    else
        /opt/CometBackup/backup-daemon-start.sh
    fi
    
else
    echo "/opt/CometBackup is empty"
    if [ -f /root/.config/backup-tool/config.dat ]; then
        echo "File /root/.config/backup-tool/config.dat exists"
        echo "You may need to delete it."
    else
        /tmp/Comet_Backup-25.5.0.run --lobby
    fi
fi

while true; do
    if ! pgrep -f backup-tool > /dev/null; then
        echo "backup-tool service is not running!"
        break
    fi
    sleep 5
done