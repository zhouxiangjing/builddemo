# Copyright (c) 2017-2018 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.

LOCAL_PATH := $(call my-dir)

$(info "TARGET_ARCH_ABI is $(TARGET_ARCH_ABI)")

include $(CLEAR_VARS)
LOCAL_MODULE := snpe-sample
LOCAL_SRC_FILES := main.cpp
include $(BUILD_EXECUTABLE)

