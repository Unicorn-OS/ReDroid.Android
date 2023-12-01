to=open_gapps

unzip_download(){
unzip -d $to open_gapps*.zip
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

unzip_download
each_dir
