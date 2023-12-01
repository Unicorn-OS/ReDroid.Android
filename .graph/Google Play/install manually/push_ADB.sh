# https://groups.google.com/g/android-rpi/c/xb2fwTQbUYw
dev="localhost:5555"

adb -s $dev root

sudo adb -s $dev push open_gapps /open_gapps

# Extract
adb -s $dev shell

mv -r open_gapps/* /system/

rmdir open_gapps

exit

# Snapshot
docker stop myandroid0
docker commit myandroid0 my/opengapps:pico

# run
docker run -itd --name gapps --privileged -v ~/data:/data -p 5555:5555 my/opengapps:pico
