BUCKET_NAME="jindan-media-archive"
MEDIA_MOUNT_PATH="/data/media"

# sync homelab
rclone sync \
    $MEDIA_MOUNT_PATH \
    s3-deep-archive:$BUCKET_NAME \
    --progress \
    --fast-list \
    --skip-links \
    --transfers 32 \
    --checkers 32
