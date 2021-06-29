cmake_minimum_required(VERSION 3.4.1)

set(CMAKE_VERBOSE_MAKEFILE on)

# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(COMMON_UTILS_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# add_definitions(-DIOAPI_NO_64)

# file(GLOB_RECURSE CLIENT_HEADER_FILES  ${COMMON_UTILS_DIR}/cpu/*.h ${COMMON_UTILS_DIR}/ead/*.h)
# file(GLOB_RECURSE CLIENT_SOURCE_FILES  ${COMMON_UTILS_DIR}/cpu/*.c ${COMMON_UTILS_DIR}/ead/*.c)
# add_library(common_utils SHARED ${CLIENT_HEADER_FILES} ${CLIENT_SOURCE_FILES})

# set(CMAKE_FIND_LIBRARY_SUFFIXES ".so")
# find_library(log-lib log)
# find_library(android-lib android)
# find_library(z-lib z)

# target_link_libraries(common_utils ${log-lib} ${android-lib} ${z-lib})

add_executable(main_test main.cpp)