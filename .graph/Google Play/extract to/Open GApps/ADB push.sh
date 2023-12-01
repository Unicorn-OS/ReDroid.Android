# https://groups.google.com/g/android-rpi/c/xb2fwTQbUYw
dev="localhost:5555"

adb -s $dev root

sudo adb -s $dev push open_gapps-x86_64-11.0-pico-20220503 /open_gapps-x86_64-11.0-pico-20220503

# Extract
adb -s $dev shell

mv -r open_gapps-x86_64-11.0-pico-20220503/* /system/

rmdir open_gapps-x86_64-11.0-pico-20220503
