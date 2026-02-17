LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),LXX503)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
