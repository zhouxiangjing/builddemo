LOCAL_PATH := $(call my-dir)	# 获取本地目录

$(info LOCAL_PATH = $(LOCAL_PATH))
#$(warning LOCAL_PATH = $(LOCAL_PATH))
#$(error LOCAL_PATH = $(LOCAL_PATH))

include $(CLEAR_VARS)			# 清除所有变量
LOCAL_MODULE := main
LOCAL_SRC_FILES := main.cpp
LOCAL_LDFLAGS := -fPIE -pie 
LOCAL_LDLIBS := -llog -landroid
include $(BUILD_EXECUTABLE)

include $(call all-makefiles-under,$(LOCAL_PATH))	# 编译所有子目录

# defaultConfig {
# 	ndk {
# 		abiFilters 'armeabi-v7a', 'arm64-v8a','x86', 'x86_64'
# 	}
#
# externalNativeBuild {
# 	ndkBuild {
# 		path "src/main/cpp/Android.mk"
# 	}
# }

# Android.mk使用的GNU Make语法

# include $(BUILD_EXECUTABLE)		编译为Native C可执行程序
# include $(BUILD_SHARED_LIBRARY)	编译为动态库
# include $(BUILD_STATIC_LIBRARY)	编译为静态库
# include $(BUILD_PREBUILT)			该模块已经预先编译 BUILD_PREBUILT PREBUILT_STATIC_LIBRARY



# LOCAL_LDLIBS := 					将对系统库的依赖放到LOCAL_LDLIBS中（链接的库不产生依赖关系，一般用于不需要重新编译的库，如库不存在，则会报错找不到。如果某一个库既有动态库又有静态库，那么链接的是动态库而非静态库。）
# LOCAL_LDFLAGS := -fPIE -pie -llog 将实际需要编译链接的符号放到LOCAL_LDFLAGS中（传递给链接器的一些额外的参数，比如想传递给外面的库和库路径给ld，或者传递给ld linker的一些链接参数，-On，-EL{B}(大小端字节序)。）
# LOCAL_SHARED_LIBRARIES := 		LOCAL_LDLIBS仅用于指定系统库的依赖性。如果需要其他库，建议使用LOCAL_STATIC_LIBRARIES/LOCAL_SHARED_LIBRARIES （用于指定需要直接链接的库，库的名字不需要后缀。同时会生成依赖关系，当库不存在时会去编译这个库）
# LOCAL_STATIC_LIBRARIES :=

# 系统库
# -llog(日志库)：导入log.h头文件
# -lz(ZLib压缩库)：添加zlib.h和zconf.h头文件；
# -ldl(动态链接器库)：添加dlfcn.h头文件，可以访问Android动态链接器的dlopen()、dlsym()和dlclose()函数；
# -lGLESv3(OpenGL ES3.1库)：此变量API 21开始，添加gl31.h和gl3ext.h头文件，提供了渲染机制，参考EGL原生平台接口；从API 9开始提供EGL API,可以使用GLSurfaceView;
# -ljnigraphics：允许C/C++以可靠方式访问Java位图对象的像素缓冲区，导入bitmap.h头文件，jnigraphics工作流程参考：NDK API中的jnigraphics;
# -lOpenMAXAL（多媒体库）：导入OMXAL/OpenMAXAL.h和OMXAL/OpenMAXAL_Platform.h头文件，提供原生多媒体处理库；
# -landroid（android原生头文件库）： 原生头文件列表包括native_activity.h、looper.h、input.h、keycodes.h等等，如需了解头文件详情参考：NDK API参考文档；