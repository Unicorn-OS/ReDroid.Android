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

    echo $src $dst

    if [ -d "$src" ]; then
        sudo adb -s $dev push $src/* /system/$dst
        mv $1 $d/.done/
        echo -n
    else
        echo "(debug) Directory $dir doesn't exist!"
    fi
}

all(){
    push_dir app
    push_dir priv-app

    cd common
    push_dir etc #common/
    push_dir framework #common/
    push_dir lib #common/
    push_dir product #common/
    cd ..
}


main(){
    cd $d
    mkdir -p .done
    all
}

main