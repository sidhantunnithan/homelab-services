#!/bin/bash
set -euo pipefail

# Requires: source .secrets.env
: "${SERVICE_DATA_BUCKET:?set SERVICE_DATA_BUCKET in .secrets.env}"
: "${RCLONE_CONFIG:?set RCLONE_CONFIG in .secrets.env}"

HOMELAB_SERVICES_MOUNT_PATH="/data/service_data"

# sync homelab services data
sudo rclone --config "$RCLONE_CONFIG" sync \
    "$HOMELAB_SERVICES_MOUNT_PATH" \
    "s3-intelligent:${SERVICE_DATA_BUCKET}" \
    --exclude "deluge/downloads/**" \
    --exclude "cache/**" \
    --progress \
    --fast-list \
    --skip-links \
    --size-only \
    --transfers 8 \
    --checkers 8
