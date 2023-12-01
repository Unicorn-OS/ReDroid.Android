from=androidbase

# Snapshot
docker stop androidbase
docker commit androidbase my/opengapps:stock
docker rm androidbase

# run
docker run -itd --name androidgapps --privileged -v ~/data:/data -p 5555:5555 my/opengapps:stock

docker ps --all
