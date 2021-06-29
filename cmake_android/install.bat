@echo off

adb push build/bin/. /data/local/tmp/build_test
adb shell "cd /data/local/tmp/build_test && export LD_LIBRARY_PATH=. && chmod 777 main_test && ./main_test"