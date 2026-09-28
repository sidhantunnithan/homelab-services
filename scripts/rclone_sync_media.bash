#!/bin/bash
set -euo pipefail

# Requires: source .secrets.env
: "${MEDIA_ARCHIVE_BUCKET:?set MEDIA_ARCHIVE_BUCKET in .secrets.env}"
: "${RCLONE_CONFIG:?set RCLONE_CONFIG in .secrets.env}"

MEDIA_MOUNT_PATH="/data/media"

# sync homelab
rclone --config "$RCLONE_CONFIG" sync \
    "$MEDIA_MOUNT_PATH" \
    "s3-deep-archive:${MEDIA_ARCHIVE_BUCKET}" \
    --progress \
    --fast-list \
    --skip-links \
    --transfers 8 \
    --checkers 8
