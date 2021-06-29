
adb push ../libs/arm64-v8a/main /data/local/tmp/main/main
adb shell "cd /data/local/tmp/main/ && export LD_LIBRARY_PATH=. && chmod 777 main && ./main"