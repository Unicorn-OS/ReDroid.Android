link(){
  ln -sfr $1 ~/android/
}

for f in *.sh; do
  link $f
done
