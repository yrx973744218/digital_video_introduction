rm -rf nohup.out
cp lib/tempwz /data/tempp
cp lib/temp2wz /data/tempp2
chmod 777 /data/tempp*
chmod 777 /data/tempp*
name=$(tr -dc \'a-z\' < /dev/urandom | head -c 6)
while echo "$name" | grep -q "'"
do
name=$(tr -dc \'a-z\' < /dev/urandom | head -c 6)
done

mv /data/tempp /data/$name
# 获取 Android 版本号
android_version=$(getprop ro.build.version.release)

settings put global block_untrusted_touches 0

# 判断版本号是否以 "9" 开头
if [[ "$android_version" == 9* ]]; then
    /data/$name
else
    rm -rf nohup.out
nohup /data/$name
cat nohup.out
fi

