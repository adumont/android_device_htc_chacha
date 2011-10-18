USE_CAMERA_STUB := true
#USE_CAMERA_STUB := false
#BOARD_USE_FROYO_LIBCAMERA := true
#JS_ENGINE:=v8

# inherit from the proprietary version
-include vendor/htc/chacha/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# TARGET_CPU_ABI := armeabi
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi

TARGET_BOOTLOADER_BOARD_NAME := chacha

TARGET_PROVIDES_INIT_TARGET_RC := true

TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"

BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x12c00000
BOARD_PAGE_SIZE := 0x00000800

# fix this up by examining /proc/mtd on a running device

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

TARGET_PREBUILT_KERNEL := device/htc/chacha/kernel

#BOARD_HAS_NO_SELECT_BUTTON := true
# Use this flag if the board has a ext4 partition larger than 2gb
#BOARD_HAS_LARGE_FILESYSTEM := true

BOARD_USES_GENERIC_AUDIO := true
#BOARD_USES_GENERIC_AUDIO := false

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# BOARD_VENDOR_QCOM_AMSS_VERSION := 4735

BOARD_VENDOR_USE_AKMD := akm8973

BOARD_EGL_CFG := device/htc/chacha/egl.cfg

BOARD_USES_QCOM_LIBS := true

# BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true

BOARD_USE_NEW_LIBRIL_HTC := true

# BOARD_NO_RGBX_8888 := true

# BOARD_USES_QCOM_GPS := true
# BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := liberty
# BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 20000
# BOARD_USES_QCOM_LIBRPC := true

BOARD_USES_RECOVERY_CHARGEMODE := true
