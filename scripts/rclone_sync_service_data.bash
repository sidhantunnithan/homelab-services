#!/bin/bash
BUCKET_NAME="jindan-service-data"
HOMELAB_SERVICES_MOUNT_PATH="/data/service_data"

# sync homelab services data
sudo rclone --config /home/sidhant/.config/rclone/rclone.conf sync \
    $HOMELAB_SERVICES_MOUNT_PATH \
    s3-intelligent:${BUCKET_NAME} \
    --exclude "deluge/downloads/**" \
    --exclude "cache/**" \
    --progress \
    --fast-list \
    --skip-links \
    --size-only \
    --transfers 8 \
    --checkers 8
