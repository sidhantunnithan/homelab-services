rclone sync \
    /home/jindan/mounts \
    glacier:jindan-deep-archive/homelab \
    --exclude "jellyfin/media/**" \
    --exclude "cache/**" \
    --progress \
    --fast-list \
    --transfers 32 \
    --checkers 32