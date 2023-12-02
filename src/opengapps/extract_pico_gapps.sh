to=open_gapps
zip=open_gapps-x86-11.0-pico-20220503.zip
this=`pwd`
d=$this/$to

# sync Dirs
app=$d/app
priv_app=$d/priv-app
common=$d/common

unzip_archive(){
  unzip -d $to $zip
}

clean(){
  rm -rf $to
}

decompress(){
  clean
  unzip_archive
  each_dir
}

extract_lz_archives(){
  for f in *.lz;do
    tar --lzip -xvf $f
    rm $f
  done
}

each_dir(){
  cd $to

  cd Core
  extract_lz_archives

  cd ../GApps
  extract_lz_archives

  cd ../Optional
  extract_lz_archives
}

rm_empty(){
  rmdir nodpi/priv-app
  rmdir nodpi
}

remove_empty_recursive(){
  # https://unix.stackexchange.com/questions/46322/how-can-i-recursively-delete-empty-directories-in-my-home-directory
  find . -type d -empty -print
  find . -type d -empty -delete
}

rsync_merge(){
  rsync -a --remove-source-files --quiet $1 $2
}

app(){
  # https://unix.stackexchange.com/questions/127712/merging-folders-with-mv
  rsync_merge app/* $app
}

priv_app(){
  rsync_merge "priv-app/*" $priv_app
}

move_to_common(){
  rsync_merge "common/*" $common
}

move_to_app(){
  cd nodpi
  for f in *;do
    if [[ "$f" == "priv-app" ]];then
      priv_app
    else
      app
    fi
  done
  cd ..
}

contains_inner_app(){
  cd $1

  for f in *;do
    if [[ "$f" == "nodpi" ]];then
      move_to_app
    else
      move_to_common
    fi
  done
  cd ..
}

extract_to_dirs(){
  cd $1
  for f in */;do
    contains_inner_app $f
    remove_empty_recursive
  done
  cd ..
  rmdir $1
}

all(){
  cd $this/$to
  extract_to_dirs Core
  extract_to_dirs GApps
  extract_to_dirs Optional
}

bac(){
  decompress
  tar -cf open_gapps.tar open_gapps
}

restore(){
  clean
  tar -xf open_gapps.tar
}


main(){
  mkdir -p $app $common $priv_app
  # decompress
  restore
  all
}

main
