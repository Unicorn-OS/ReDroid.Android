# https://groups.google.com/g/android-rpi/c/xb2fwTQbUYw

dev="localhost:5555"

adb connect localhost:5555

adb -s $dev root

sudo adb -s $dev push open_gapps /open_gapps

# Extract
adb -s $dev shell

mv open_gapps/* /system/

rmdir open_gapps

exit
