future_container=gappstest
container=newandroid
dev=localhost:5555

remove_starting_container(){
    docker stop $container
    docker rm --force $container
}

remove_future_container(){
    docker stop $future_container
    docker rm --force $future_container
}


launch(){
    docker stop $container

    docker run -itd --privileged --pull always -v ~/data11:/data -p 5555:5555 --name $container redroid/redroid:11.0.0-latest
}

reset_connection(){
    adb kill-server
    adb connect $dev
}

debug(){
    docker ps --all
}

main(){
    remove_starting_container
    remove_future_container
    launch
    reset_connection
    debug
}

main