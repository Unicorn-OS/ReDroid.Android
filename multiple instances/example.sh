docker run -itd --rm --privileged \
    --pull always \
    -v ~/data:/data \
    -p 5555:5555 \
    redroid/redroid:11.0.0-latest

docker run -itd --rm --privileged \
    --pull always \
    -v ~/data1:/data \
    -p 5556:5555 \
    redroid/redroid:11.0.0-latest

docker run -itd --rm --privileged \
    --pull always \
    -v ~/data2:/data \
    -p 5557:5555 \
    redroid/redroid:11.0.0-latest

adb connect localhost:5555
adb connect localhost:5556
adb connect localhost:5557

scrcpy --rotation=1 -s localhost:5555
scrcpy --rotation=1 -s localhost:5556
scrcpy --rotation=1 -s localhost:5557
