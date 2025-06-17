#!/bin/bash
set -e
echo "Username: $COMET_USERNAME"
echo "Password: $COMET_PASSWORD"
echo "Password: $COMET_SERVER_URL"

# Verify if the Comet Backup folder exists
if [ ! -d /opt/CometBackup ]; then
    echo "Comet Backup folder does not exists."
    echo "Downloading Comet Backup..."
    wget -O comet.run --content-disposition --post-data "SelfAddress=${COMET_SERVER_URL//\//%2F}&Platform=7" "${COMET_SERVER_URL}api/v1/admin/branding/generate-client/by-platform"
    echo "Installing with file: $filename ..."
    (echo $COMET_USERNAME; echo $COMET_PASSWORD;) | bash /tmp/comet.run
else
    echo "Comet Backup folder already exists, skipping installation."
    # (echo $COMET_USERNAME; echo $COMET_PASSWORD;) | /opt/CometBackup/backup-tool login prompt
    /opt/CometBackup/backup-daemon-start-background.sh
fi

attempts=0

while true; do
    if ! pgrep -f backup-tool > /dev/null; then
        if pgrep -f comet > /dev/null; then
            echo "Upgrade happening..."
        fi

        attempts=$((attempts + 1))
        if [ "$attempts" -ge 3 ]; then
            echo "backup-tool service is not running after 3 attempts!"
            break
        fi
    else
        # Reset attempts if backup-tool is running
        attempts=0
    fi

    sleep 15
done