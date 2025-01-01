
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from jmax device
$(call inherit-product, device/8849/TANK3/device.mk)

# Configure launch_with_vendor_ramdisk.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

PRODUCT_MANUFACTURER := OBLUE
PRODUCT_BRAND := 8849
PRODUCT_MODEL := TANK 3
PRODUCT_DEVICE := TANK3
PRODUCT_NAME := twrp_$(PRODUCT_DEVICE)

LOCAL_PATH := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))
LOCAL_PATH := $(patsubst %/,%,$(LOCAL_PATH))

PRODUCT_GMS_CLIENTID_BASE := android-agold

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=TANK3 \
    PRODUCT_NAME=TANK3 \
    PRIVATE_BUILD_DESC="TANK3-user 12 SP1A.210812.016 root.20240422.112452 release-keys"

BUILD_FINGERPRINT := "8849/TANK3/TANK3:12/SP1A.210812.016/root.20240422.112452:user/release-keys"
