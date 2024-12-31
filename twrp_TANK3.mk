#
# Copyright (C) 2024 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure launch_with_vendor_ramdisk.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure twrp config common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# Configure compression
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Device specific configs
$(call inherit-product, device/8849/TANK3/device.mk)

# Configure virtual_ab_ota.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Device identifier
PRODUCT_DEVICE := TANK3
PRODUCT_NAME := twrp_TANK3
PRODUCT_BRAND := 8849
PRODUCT_MODEL := TANK 3
PRODUCT_MANUFACTURER := OBLUE
PRODUCT_RELEASE_NAME := TANK3

# Hide Reflash TWRP & FUSE passthrough
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.vendor_boot=true \
    persist.sys.fuse.passthrough.enable=true

PRODUCT_GMS_CLIENTID_BASE := android-agold

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=TANK3 \
    PRODUCT_NAME=TANK3 \
    PRIVATE_BUILD_DESC="TANK3-user 12 SP1A.210812.016 root.20240422.112452 release-keys"

BUILD_FINGERPRINT := "8849/TANK3/TANK3:12/SP1A.210812.016/root.20240422.112452:user/release-keys"
