docker run -itd --rm --privileged \
    --pull always \
    -v ~/data:/data \
    -p 5555:5555 \
    {{ docker_pull_image }} \
    androidboot.redroid_fps \
    androidboot.redroid_gpu_mode=host