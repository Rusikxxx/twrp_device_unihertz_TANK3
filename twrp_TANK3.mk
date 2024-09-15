# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2024 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#

# Inherit from Device specific configs.
$(call inherit-product, device/8849/TANK3/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Product Specifics
PRODUCT_NAME := twrp_TANK3
PRODUCT_DEVICE := TANK3
PRODUCT_BRAND := 8849
PRODUCT_MODEL := TANK 3
PRODUCT_MANUFACTURER := OBLUE

PRODUCT_PLATFORM := mt6895

PRODUCT_GMS_CLIENTID_BASE := android-agold
