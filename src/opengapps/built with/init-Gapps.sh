container=newandroid

docker run -itd --privileged -v ~/data:/data -p 5555:5555 --name $container redroid

adb connect localhost:5555

adb -s localhost:5555 root
adb -s localhost:5555 shell 'sqlite3 /data/data/com.google.android.gsf/databases/gservices.db \
   "select * from main where name = \"android_id\";"'

scrcpy -s localhost:5555
