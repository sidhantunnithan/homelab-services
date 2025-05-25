rclone sync \
    /home/jindan/mounts \
    glacier:jindan-deep-archive/homelab \
    --exclude "jellyfin/media/**" \
    --exclude "cache/**" \
    --progress \
    --transfers 32 \
    --checkers 32