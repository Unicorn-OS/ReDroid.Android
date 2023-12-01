# https://groups.google.com/g/android-rpi/c/xb2fwTQbUYw
dev="localhost:5555"

adb -s $dev root

sudo adb -s $dev push open_gapps-x86_64-11.0-pico-20220503 /open_gapps-x86_64-11.0-pico-20220503

# Extract
adb -s $dev shell

mv -r open_gapps-x86_64-11.0-pico-20220503/* /system/

rmdir open_gapps-x86_64-11.0-pico-20220503

exit

# Snapshot
docker stop myandroid0
docker commit myandroid0 my/opengapps:pico

# run
docker run -itd --name gapps --privileged -v ~/data:/data -p 5555:5555 my/opengapps:pico
