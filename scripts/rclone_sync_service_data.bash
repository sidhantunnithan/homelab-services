BUCKET_NAME="jindan-service-data"
HOMELAB_SERVICES_MOUNT_PATH="/data/service_data"

# sync homelab services data
rclone sync \
    $HOMELAB_SERVICES_MOUNT_PATH \
    s3-intelligent:${BUCKET_NAME} \
    --exclude "deluge/downloads/**" \
    --exclude "cache/**" \
    --progress \
    --fast-list \
    --skip-links \
    --transfers 32 \
    --checkers 32
