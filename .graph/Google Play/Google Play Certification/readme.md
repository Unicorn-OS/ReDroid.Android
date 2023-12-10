# Google Play Certification
https://docs.waydro.id/faq/google-play-certification

https://github.com/remote-android/redroid-doc/issues?q=certified
- https://github.com/remote-android/redroid-doc/issues/235
- https://github.com/remote-android/redroid-doc/issues/48

# Solution:
- https://github.com/remote-android/redroid-doc/issues/378

```
adb -s localhost:5555 root
adb -s localhost:5555 shell 'sqlite3 /data/data/com.google.android.gsf/databases/gservices.db \
   "select * from main where name = \"android_id\";"'
```
```
pasteIn(){
   url = "https://www.google.com/android/uncertified"
}
```
