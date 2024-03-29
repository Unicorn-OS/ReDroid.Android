container=newandroid
newimage=gapps
newcontainer=gappstest

dev="localhost:5555"

remove_old(){
    docker stop $newcontainer
    docker rm $newcontainer
    docker rmi $newimage
}

shutdown(){
    adb -s $dev shell reboot -p
}

reboot(){
    adb -s $dev shell reboot
}

snapshot(){
    reboot
    sleep 3
    docker stop $container

    docker commit $container $newimage

    docker rm --force $container
}

debug(){
    docker ps --all
}

main(){
    remove_old
    snapshot
    debug
}

main