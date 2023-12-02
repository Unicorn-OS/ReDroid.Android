docker stop redroid11

docker run -itd --rm --privileged --pull always -v ~/data11:/data -p 5555:5555 --name new redroid/redroid:11.0.0-latest
