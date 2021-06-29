# builddemo
各个编译工具的使用

# cmake 常用命令   参考大全（https://www.cnblogs.com/zjutzz/p/13340318.html）

设置变量：SET(USER_KEY, "Hello World")

打印日志：message([STATUS|WARNING|AUTHOR_WARNING|FATAL_ERROR|SEND_ERROR] "message to display ${USER_KEY}" ...)

获取路径信息：get_filename_component(SRC_MAIN ${CMAKE_SOURCE_DIR} DIRECTORY|NAME)
当选项为DIRECTORY时，SRC_MAIN的值为CMAKE_SOURCE_DIR的上一层目录
当选项为NAME时，SRC_MAIN的值为CMAKE_SOURCE_DIR的最后一层目录名称

添加寻址路径
include_directories(${INCLUDE_DIR1})

添加子目录
if (${ANDROID_ABI} STREQUAL "arm64-v8a")
    add_subdirectory(xxxx)
endif()

遍历添加文件
file(GLOB_RECURSE CLIENT_HEADER_FILES  ${SRC_MAIN}/*.h)
file(GLOB_RECURSE CLIENT_SOURCE_FILES  ${SRC_MAIN}/*.cpp)

添加android系统库
find_library(log-lib log)
find_library(android-lib android)
find_library(z-lib z)

添加三方库
add_library(common_utils SHARED ${CLIENT_HEADER_FILES} ${CLIENT_SOURCE_FILES})

添加可执行文件
add_executable(main_test main.cpp)

链接库生成库
target_link_libraries(common_utils  ${log-lib} ${android-lib} ${z-lib} common_utils)
target_link_libraries(main_test)

