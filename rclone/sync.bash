rclone sync \
    /home/jindan/mounts \
    glacier:jindan-deep-archive/homelab \
    --exclude "jellyfin/media/**" \
    --exclude "deluge/downloads/**" \
    --exclude "cache/**" \
    --progress \
    --fast-list \
    --transfers 32 \
    --checkers 32