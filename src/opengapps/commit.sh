container=newandroid
newimage=gapps
newcontainer=gappstest

remove_old(){
    docker stop $newcontainer
    docker rm $newcontainer
    docker rmi $newimage
}

snapshot(){
    adb -s $dev shell reboot -p

    sleep 2
    docker stop $container

    docker commit $container $newimage

    docker rm --force $container
}