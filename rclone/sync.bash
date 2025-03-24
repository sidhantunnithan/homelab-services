docker run -it --rm \
    -v /home/jindan/.config/rclone:/config \
    -v /home/jindan/mounts:/sync \
    rclone/rclone \
    sync /sync b2:homelab-zeus \
    --progress --transfers 32
