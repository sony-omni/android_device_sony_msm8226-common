# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from qcom-common
include device/sony/qcom-common/BoardConfigCommon.mk

include device/sony/common/BoardConfigCommon.mk

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := msm8226
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

TARGET_KERNEL_SOURCE := kernel/sony/eagle

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/sony/msm8226-common/boot/custombootimg.mk
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
TARGET_DTB_EXTRA_FLAGS := --force-v2

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=yukon user_debug=31 msm_rtb.filter=0x37 androidboot.selinux=permissive

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1962934272
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5460983808
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_PERSISTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01000000
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 73400320
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
BOARD_EGL_CFG := device/sony/msm8226-common/rootdir/system/lib/egl/egl.cfg

BOARD_USES_QCOM_HARDWARE := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USES_QCOM_BSP := true
TARGET_QCOM_AUDIO_VARIANT := caf-bfam
TARGET_QCOM_DISPLAY_VARIANT := caf-bfam
TARGET_QCOM_MEDIA_VARIANT := caf-bfam
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DQCOM_MDP_DISABLE_CHECK_FOR_ANIMATION
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

# NFC
BOARD_NFC_CHIPSET := pn547

# RIL
BOARD_PROVIDES_LIBRIL := true

# Camera
TARGET_USES_ION := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Wi-Fi definitions for Qualcomm solution
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X

BOARD_USE_SONY_MACUPDATE := true

# BT definitions for Qualcomm solution
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/msm8226-common/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true

# GPS definitions for Qualcomm solution
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Power definitions for Qualcomm solution
TARGET_POWERHAL_VARIANT := qcom
CM_POWERHAL_EXTENSION := yukon

TARGET_SYSTEM_PROP := device/sony/msm8226-common/system.prop

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true
