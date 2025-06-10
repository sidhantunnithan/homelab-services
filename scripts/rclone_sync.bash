rclone sync \
    /home/jindan/mounts \
    glacier:jindan-deep-archive/homelab \
    --exclude "deluge/downloads/**" \
    --exclude "cache/**" \
    --progress \
    --fast-list \
    --skip-links \
    --transfers 32 \
    --checkers 32