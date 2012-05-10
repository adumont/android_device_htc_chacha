#
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

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product, build/target/product/languages_full.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# dalvik heap config for devices with 512MB memory
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/chacha/media_a1026.mk)

DEVICE_PACKAGE_OVERLAYS := device/htc/chacha/overlay

# Odex build
DISABLE_DEXPREOPT := false

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/chacha/key/chacha-keypad.kl:system/usr/keylayout/chacha-keypad.kl \
    device/htc/chacha/key/chacha-keypad.kcm:system/usr/keychars/chacha-keypad.kcm \
    device/htc/chacha/key/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/chacha/key/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl

PRODUCT_COPY_FILES += \
    device/htc/chacha/ueventd.chacha.rc:root/ueventd.chacha.rc \
    device/htc/chacha/init.chacha.usb.rc:root/init.chacha.usb.rc \
    device/htc/chacha/init.chacha.rc:root/init.chacha.rc

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.enable.dtm=1 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.disable.fd.plmn.prefix=23402,23410,23411 \
    ro.ril.def.agps.mode=2 \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=12 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2,gprs,ppp0 \
    wifi.interface = wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.sf.lcd_density = 160 \
    ro.opengles.version=131072 \
    ro.htc.camerahack=msm7k

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# For emmc phone storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage = 0

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/chacha/chacha-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    settings.display.autobacklight=1 \
    settings.display.brightness=143 \
    persist.service.mount.playsnd = 0 \
    ro.com.google.locationfeatures = 1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1 \
    dalvik.vm.dexopt-flags=m=y \
    net.bt.name=Android \
    ro.config.sync=yes

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/chacha/media_profiles.xml:system/etc/media_profiles.xml

# device specific
PRODUCT_PACKAGES += \
    lights.chacha \
    sensors.chacha \
    gps.chacha \
    camera.chacha \
    audio.a2dp.default \
    audio.primary.chacha \
    audio_policy.chacha

# kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
        LOCAL_KERNEL := device/htc/chacha/kernel
else
        LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    device/htc/chacha/kernel/bcm4329.ko:system/lib/modules/bcm4329.ko \
    $(LOCAL_KERNEL):kernel

# gpu
PRODUCT_PACKAGES += \
    gralloc.msm7x27 \
    copybit.msm7x27 \
    hwcomposer.default \
    hwcomposer.msm7x27

# audio
PRODUCT_PACKAGES += \
    libtinyalsa \
    libaudioutils

# OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore

# live wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    NoiseField \
    PhaseBeam \
    MagicSmoke \
    Galaxy4 \
    HoloSpiralWallpaper \
    librs_jni

# missing packages
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    Superuser \
    Torch

PRODUCT_COPY_FILES += \
    device/htc/chacha/vold.fstab:system/etc/vold.fstab \
    device/htc/chacha/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc

# Prebuilt modules or firmware
PRODUCT_COPY_FILES += \
    device/htc/chacha/firmware/BCM4329B1_002.002.023.0831.0841.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/chacha/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/chacha/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

PRODUCT_NAME := generic_chacha
PRODUCT_DEVICE := chacha
