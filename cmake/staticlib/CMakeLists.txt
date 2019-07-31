cmake_minimum_required(VERSION 3.4.1)

set(CMAKE_VERBOSE_MAKEFILE on)

# add_library(zxj SHARED IMPORTED )
# set_target_properties(zxj PROPERTIES IMPORTED_LOCATION "zxj.so")

add_library(staticlib STATIC staticlib.cpp)

# target_link_libraries(staticlib log)