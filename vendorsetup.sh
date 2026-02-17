#!/bin/bash

FDEVICE="LXX503"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep \"$FDEVICE\")
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

export DEVICE="LXX503"
export OEM="LAVA"

export FOX_VIRTUAL_AB_DEVICE=1
export FOX_EXCLUDE_ZIP=1
export FOX_TARGET_DEVICES=LXX503
export FOX_DELETE_AROMAFM=1
export FOX_DELETE_MAGISK_ADDON=1
export FOX_DELETE_INITD_ADDON=1
export FOX_REMOVE_BASH=1
export FOX_REMOVE_AAPT=1
export FOX_VARIANT="A14"
export FOX_DRASTIC_SIZE_REDUCTION=1
export FOX_EXTREME_SIZE_REDUCTION=1

# OrangeFox flags
	export OF_USE_MAGISKBOOT := 1
	export OF_PATCH_AVB20 := 1
	export OF_SUPPORT_VBMETA_AVB2_PATCHING := 1
	export OF_FIX_DECRYPTION_ON_DATA_MEDIA :=1
	export OF_FORCE_PREBUILT_KERNEL := 1
	export OF_DEFAULT_TIMEZONE := IST-5:30
	export OF_MAINTAINER := Ayus Chatterjee
	export OF_CLOCK_POS := 1
	export OF_HIDE_NOTCH := 1
	export OF_FLASHLIGHT_ENABLE := 1
	export OF_SCREEN_H := 2400 # (aspect ratio height) × 120, 20 × 120
	export OF_QUICK_BACKUP_LIST := "/boot;/data;"
	export OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
	export OF_NO_REFLASH_CURRENT_ORANGEFOX := 1
	export OF_USE_GREEN_LED := 0
	export OF_FORCE_CASEFOLDING := 1
	export OF_OPTIONS_LIST_NUM := 9
	export OF_UNBIND_SDCARD_F2FS := 1
	export OF_FORCE_DATA_FORMAT_F2FS := 1
	export OF_USE_DMCTL := 1
	export OF_WIPE_METADATA_AFTER_DATAFORMAT := 1
	export OF_BIND_MOUNT_SDCARD_ON_FORMAT := 1
	export OF_LOOP_DEVICE_ERRORS_TO_LOG := 1
	export OF_DEFAULT_KEYMASTER_VERSION := 4.1
	export OF_FL_PATH1 := /sys/class/flashlight_core/flashlight/flashlight_torch/flashlight_torch
	export OF_FL_PATH2 := /sys/class/flashlight_core/flashlight/flashlight_torch/subsystem/flashlight

# Build
export LC_ALL="C"
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_BUILD_DEVICE="LXX503"

# ~ cache
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_MAXSIZE="5G"
export CCACHE_DIR="~/ccache"

if [ ! -d ${CCACHE_DIR} ];
then
  echo "CCACHE Directory/Partition is not mounted at \"${CCACHE_DIR}\""
  echo "Please edit the CCACHE_DIR build variable or mount the directory."
fi

# Clone to fix build on minimal manifest
git clone https://android.googlesource.com/platform/external/gflags/ -b android-12.1.0_r4 external/gflags
