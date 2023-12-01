dev="localhost:5555"

adb -s $dev root

sudo adb -s $dev push open_gapps-x86_64-11.0-pico-20220503 /open_gapps-x86_64-11.0-pico-20220503
