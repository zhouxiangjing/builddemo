
project_name="main_test"

source ./build.sh

adb push build/bin/* //data/local/tmp/$project_name/

adb shell "cd /data/local/tmp/$project_name && export LD_LIBRARY_PATH=. && chmod 777 $project_name && ./$project_name"