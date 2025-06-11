#!/bin/bash
set -e
echo "Username: $COMET_USERNAME"
echo "Password: $COMET_PASSWORD"
# Verify if the Comet Backup folder exists
if [ ! -d /opt/CometBackup ]; then
    echo "Comet Backup folder does not exists. Installing."
    (echo $COMET_USERNAME; echo $COMET_PASSWORD;) | /tmp/Comet_Backup-25.5.0.run
else
    echo "Comet Backup folder already exists, skipping installation."
    # (echo $COMET_USERNAME; echo $COMET_PASSWORD;) | /opt/CometBackup/backup-tool login prompt
    /opt/CometBackup/backup-daemon-start-background.sh
fi

while true; do
    if ! pgrep -f backup-tool > /dev/null; then
        echo "backup-tool service is not running!"
        break
    fi
    sleep 5
done