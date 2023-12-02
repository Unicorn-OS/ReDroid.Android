to=open_gapps
this=`pwd`
d=$this/$to

# Android device
dev="localhost:5555"

root_shell(){
    adb -s $dev root
}

push_dir(){
    src=$1

    if [ -z "$2" ]; then
        dst=$src
    else
        dst=$2$src
    fi

    # echo $src $dst

    if [ -d "$src" ]; then
        echo $src
        sudo adb -s $dev push $src/* /system/$dst
        mv $1 $d/.done/
    else
        echo "(debug) Directory $dir doesn't exist!"
    fi
}

all(){
    push_dir app
    push_dir priv-app

    cd common
    push_dir etc
    push_dir framework
    push_dir lib
    push_dir product
    cd ..
}


main(){
    cd $d
    mkdir -p .done
    root_shell
    all
}

main