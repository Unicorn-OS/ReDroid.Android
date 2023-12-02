container=newandroid
dev=localhost:5555

docker stop $container

docker run -itd --rm --privileged --pull always -v ~/data11:/data -p 5555:5555 --name $container redroid/redroid:11.0.0-latest

adb kill-server

adb connect $dev
