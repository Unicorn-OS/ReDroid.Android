container=redroid11
newimage=my/opengapps

# Snapshot
docker stop $container
docker commit $container $newimage
docker rm $container

# run
docker run -itd --name gapps --privileged -v ~/data:/data -p 5555:5555 $newimage

docker ps --all
