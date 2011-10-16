USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/chacha/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi
TARGET_BOOTLOADER_BOARD_NAME := chacha

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
