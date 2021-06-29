
# project_name="main_test"

# source ./build.sh

# adb push build/bin/* /data/local/tmp/$project_name/

# adb shell "cd /data/local/tmp/$project_name && export LD_LIBRARY_PATH=. && chmod 777 $project_name && ./$project_name"

# read anykey

# 手动执行代码
adb push build/bin/. /data/local/tmp/build_test
adb shell "cd /data/local/tmp/build_test && export LD_LIBRARY_PATH=. && chmod 777 main_test && ./main_test"