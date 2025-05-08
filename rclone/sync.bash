docker run -it --rm \
    -v /home/jindan/.config/rclone:/config \
    -v /home/jindan/mounts:/sync \
    rclone/rclone \
    sync /sync b2:homelab-zeus \
    --exclude "anime/**" \
    --exclude "movies/**" \
    --exclude "series/**" \
    --exclude "downloads/**" \
    --progress --transfers 32
