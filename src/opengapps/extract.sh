to=open_gapps
zip=open_gapps-x86-11.0-pico-20220503.zip
this=`pwd`
app=$this/$to/app
common=$this/$to/common

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
}

is_app(){
  rsync -a --remove-source-files app/* $app
  # mv app/* $app
  rmdir app
}

is_priv_app(){
  rsync -a --remove-source-files priv-app/* $app
  # mv priv-app/* $app
  rmdir priv-app
}

move_to_app(){
  cd nodpi
  for f in *;do
    if [[ "$f" == "priv-app" ]];then
      ls
      is_priv_app
    else
      echo not private
      is_app
    fi
  done
  cd ~-
  echo
}

move_to_common(){
  # https://unix.stackexchange.com/questions/127712/merging-folders-with-mv
  rsync -a --remove-source-files common/* $common
}

contains_inner_app(){
  cd $1

  for f in *;do
    if [[ "$f" == "nodpi" ]];then
      # pwd
      # move_to_app $1
      # pwd
      # rmdir nodpi
      echo
    else
      # debug_no_dpi
      ls
      pwd
      move_to_common
      remove_empty_recursive
    fi
  done
  cd ~-
}

extract_to_app(){
  mkdir -p $app $common

  cd $this/$to/Core
  for f in */;do
    # echo $f
    contains_inner_app $f
    # pwd
    # rmdir $f
    # mv $f/nodpi/priv-app/*
  done
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
  # decompress
  restore
  extract_to_app
}

main
