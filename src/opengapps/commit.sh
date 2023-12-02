container=newandroid
newimage=gapps
newcontainer=gappstest

adb -s $dev shell reboot -p

sleep 2

docker commit $container $newimage

docker stop $container
docker rm --force $container

docker run -itd --privileged -v ~/data11:/data -p 5555:5555 --name $newcontainer $newimage
