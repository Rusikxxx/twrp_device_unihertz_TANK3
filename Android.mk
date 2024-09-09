# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2024 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),TANK3)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
