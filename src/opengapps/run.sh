newimage=gapps
newcontainer=gappstest

docker run -itd --privileged -v ~/data11:/data -p 5555:5555 --name $newcontainer $newimage