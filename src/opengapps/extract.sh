to=open_gapps
zip=open_gapps-x86-11.0-pico-20220503.zip
this=`pwd`
app=$this/$to/app

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

delete_empty(){
  rmdir nodpi/priv-app
  rmdir nodpi
}

inner_app(){
  cd $1

  for f in *;do
    if [[ "$f" == "nodpi" ]];then
      pwd
      mv nodpi/priv-app/* $app
      echo true
    fi
  done
  cd ..
}

extract_to_app(){
  mkdir -p $app

  cd $this/$to/Core
  for f in */;do
    # echo $f
    inner_app $f
    # mv $f/nodpi/priv-app/*
  done
}

move_up_one(){
  echo
}

main(){
  decompress
  # extract_to_app
}

main
