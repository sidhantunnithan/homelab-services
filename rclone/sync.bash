rclone sync \
    /home/jindan/mounts \
    b2:homelab-zeus/mounts \
    --exclude "jellyfin/media/**" \
    --progress \
    --transfers 32