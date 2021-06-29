#!/bin/bash

# 设置第一个参数默认值为增量编译
rebuild=${1-'build'}
# 如果是重新编译则删除编译目录
if [[ $rebuild = "rebuild" ]]; then
    echo "重新编译..."
    if [ -d "build/" ]; then
        rm -rf build/
        echo "删除编译目录"
    fi
else
    echo "增量编译..."
fi

echo "进入编译目录"
if [ -d "build/" ]; then
    cd build
else
    mkdir build && cd build
fi



echo "开始编译CMakeLists.txt"
NDK21="E:/android/ndk/android-ndk-r21e"
cmake -G "Unix Makefiles" .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=$NDK21/build/cmake/android.toolchain.cmake \
    -DCMAKE_MAKE_PROGRAM=$NDK21/prebuilt/windows-x86_64/bin/make.exe \
    -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY=bin \
    -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=bin \
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=bin \
    -DANDROID_NDK=$NDK21 \
    -DANDROID_PLATFORM=android-29 \
    -DANDROID_ARM_NEON=TRUE \
    -DANDROID_TOOLCHAIN=clang \
    -DANDROID_STL=c++_static \
    -DCMAKE_C_FLAGS="-D_EXAMPLE_C_FLAG1 -D_EXAMPLE_C_FLAG2" \
    -DCMAKE_CXX_FLAGS="-frtti -fexceptions -std=c++14 -D__STDC_FORMAT_MACROS -Wno-error=format-security -fpermissive -fopenmp -Og" \
    -DANDROID_ABI=arm64-v8a
    
	
echo "开始编译Makefile"
$NDK21/prebuilt/windows-x86_64/bin/make.exe -j4

echo "退出编译目录"
cd -
read anykey