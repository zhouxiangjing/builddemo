@echo off
set BUILD_DIR=build
set BUILD_NDK=E:/android/ndk/android-ndk-r21e
set BUILD_PLATFORM=arm64-v8a

if not exist %BUILD_DIR% md %BUILD_DIR%
cd %BUILD_DIR%

cmake -G "Unix Makefiles" .. ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_TOOLCHAIN_FILE=%BUILD_NDK%/build/cmake/android.toolchain.cmake ^
    -DCMAKE_MAKE_PROGRAM=%BUILD_NDK%/prebuilt/windows-x86_64/bin/make.exe ^
    -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY=bin ^
    -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=bin ^
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=bin ^
    -DANDROID_PLATFORM=android-16 ^
    -DANDROID_ARM_NEON=TRUE ^
    -DANDROID_TOOLCHAIN=clang ^
    -DANDROID_STL=c++_static ^
    -DCMAKE_C_FLAGS="-D_EXAMPLE_C_FLAG1 -D_EXAMPLE_C_FLAG2" ^
    -DCMAKE_CXX_FLAGS="-frtti -fexceptions -std=c++14 -D__STDC_FORMAT_MACROS -Wno-error=format-security" ^
    -DANDROID_ABI=%BUILD_PLATFORM%

cmake --build . -- -j 3

cd ..