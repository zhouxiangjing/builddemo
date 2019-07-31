cmake_minimum_required(VERSION 3.4.1)

set(CMAKE_VERBOSE_MAKEFILE on)  # 开启编译信息

set(MY_INCLUDE_DIR "${CMAKE_SOURCE_DIR}/include")
set(MY_LIBS_DIR "${CMAKE_SOURCE_DIR}/jniLibs/${ANDROID_ABI}")

include_directories(${MY_INCLUDE_DIR})
include_directories("shareadlib")
include_directories("staticlib")

add_subdirectory(shareadlib)
add_subdirectory(staticlib)

add_executable(main main.cpp)

target_link_libraries(main shareadlib staticlib)