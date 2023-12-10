docker run -itd --rm --privileged \
    --pull always \
    -v ~/data:/data \
    -p 5555:5555 \
    --name trygpu \
    redroid/redroid:11.0.0-latest \
    androidboot.redroid_gpu_mode=host