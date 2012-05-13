# Copyright (C) 2009 The Android Open Source Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/chacha/BoardConfigVendor.mk

# Provide missing header files
TARGET_SPECIFIC_HEADER_PATH := device/htc/chacha/include

### Board config
TARGET_BOARD_PLATFORM := msm7x27
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi

TARGET_BOOTLOADER_BOARD_NAME := chacha

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

BOARD_VENDOR_QCOM_AMSS_VERSION := 4735

### Kernel
#TARGET_KERNEL_SOURCE := kernel/htc/msm7227
#TARGET_KERNEL_CONFIG := cyanogen_msm7227_defconfig

### USB Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

### Wifi related defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_HOSTAPD_DRIVER        := WEXT
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_wext
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan0 firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"

### Kernel related stuff
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x12c00000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_PREBUILT_KERNEL := device/htc/chacha/kernel/zImage

### Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

### Audio
# http://arunraghavan.net/2012/01/pulseaudio-vs-audioflinger-fight/
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := false
BOARD_USES_QCOM_VOIPMUTE := true
BOARD_USES_QCOM_RESETALL := true

### FM radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

BOARD_VENDOR_USE_AKMD := akm8975

### Graphics
# http://www.slideshare.net/jserv/design-and-concepts-of-android-graphics
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DREFRESH_RATE=60 -DBINDER_COMPAT

BOARD_USES_QCOM_HARDWARE := true
BOARD_EGL_CFG := device/htc/chacha/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true

### Touchscreen
# Allow compatibility with 'old' Touchscreens (Linux < 3.1)
#
# Remember to add the new idc file required for the touchscreen/keypad
# Example: /system/usr/idc/qtouch-touchscreen.idc
#
# http://review.cyanogenmod.com/#change,10354
BOARD_USE_LEGACY_TOUCHSCREEN := true

### Browser
JS_ENGINE := v8
HTTP := chrome
WITH_JIT := true
ENABLE_JSC_JIT := true

### GPS
BOARD_USES_QCOM_LIBS := true
#BOARD_USES_QCOM_GPS := true
#BOARD_USES_QCOM_LIBRPC := true
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := chacha
#BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 20000

### RIL
BOARD_USE_NEW_LIBRIL_HTC := true

### CAMERA
# This is needed by libcamera.so
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true

# cat /proc/mtd (chacha)

# dev:    size   erasesize  name
# mtd0: 00100000 00040000 "misc"
# mtd1: 00500000 00040000 "recovery"
# mtd2: 00340000 00040000 "boot"
# mtd3: 10400000 00040000 "system"
# mtd4: 02300000 00040000 "cache"
# mtd5: 09600000 00040000 "userdata"
# mtd6: 00a00000 00040000 "devlog"

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00340000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x10400000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09600000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

#BOARD_CAMERA_USE_GETBUFFERINFO := true

#TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/chacha/prebuilt/recovery_kernel
#BOARD_USES_RECOVERY_CHARGEMODE := true
TARGET_RECOVERY_INITRC := device/htc/chacha/init.recovery.rc
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_JANKY_BACKBUFFER := true
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/chacha/recovery/graphics.c

# Odex build
WITH_DEXPREOPT := true
