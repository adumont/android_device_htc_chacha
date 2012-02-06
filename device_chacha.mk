$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/chacha/chacha-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/chacha/overlay

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/chacha/key/chacha-keypad.kl:system/usr/keylayout/chacha-keypad.kl \
    device/htc/chacha/key/chacha-keypad.kcm.bin:system/usr/keychars/chacha-keypad.kcm.bin \
    device/htc/chacha/key/chacha-keypad-ara.kcm.bin:system/usr/keychars/chacha-keypad-ara.kcm.bin \
    device/htc/chacha/key/chacha-keypad-ara.kl:system/usr/keylayout/chacha-keypad-ara.kl \
    device/htc/chacha/key/chacha-keypad-aw.kcm.bin:system/usr/keychars/chacha-keypad-aw.kcm.bin \
    device/htc/chacha/key/chacha-keypad-aw.kl:system/usr/keylayout/chacha-keypad-aw.kl \
    device/htc/chacha/key/chacha-keypad-bopomo.kcm.bin:system/usr/keychars/chacha-keypad-bopomo.kcm.bin \
    device/htc/chacha/key/chacha-keypad-bopomo.kl:system/usr/keylayout/chacha-keypad-bopomo.kl \
    device/htc/chacha/key/chacha-keypad-cn.kcm.bin:system/usr/keychars/chacha-keypad-cn.kcm.bin \
    device/htc/chacha/key/chacha-keypad-cn.kl:system/usr/keylayout/chacha-keypad-cn.kl \
    device/htc/chacha/key/chacha-keypad-ell.kcm.bin:system/usr/keychars/chacha-keypad-ell.kcm.bin \
    device/htc/chacha/key/chacha-keypad-ell.kl:system/usr/keylayout/chacha-keypad-ell.kl \
    device/htc/chacha/key/chacha-keypad-esn.kcm.bin:system/usr/keychars/chacha-keypad-esn.kcm.bin \
    device/htc/chacha/key/chacha-keypad-esn.kl:system/usr/keylayout/chacha-keypad-esn.kl \
    device/htc/chacha/key/chacha-keypad-fra.kcm.bin:system/usr/keychars/chacha-keypad-fra.kcm.bin \
    device/htc/chacha/key/chacha-keypad-fra.kl:system/usr/keylayout/chacha-keypad-fra.kl \
    device/htc/chacha/key/chacha-keypad-ger.kcm.bin:system/usr/keychars/chacha-keypad-ger.kcm.bin \
    device/htc/chacha/key/chacha-keypad-ger.kl:system/usr/keylayout/chacha-keypad-ger.kl \
    device/htc/chacha/key/chacha-keypad-hk.kcm.bin:system/usr/keychars/chacha-keypad-hk.kcm.bin \
    device/htc/chacha/key/chacha-keypad-hk.kl:system/usr/keylayout/chacha-keypad-hk.kl \
    device/htc/chacha/key/chacha-keypad-ita.kcm.bin:system/usr/keychars/chacha-keypad-ita.kcm.bin \
    device/htc/chacha/key/chacha-keypad-ita.kl:system/usr/keylayout/chacha-keypad-ita.kl \
    device/htc/chacha/key/chacha-keypad-nor.kcm.bin:system/usr/keychars/chacha-keypad-nor.kcm.bin \
    device/htc/chacha/key/chacha-keypad-nor.kl:system/usr/keylayout/chacha-keypad-nor.kl \
    device/htc/chacha/key/chacha-keypad-rus.kcm.bin:system/usr/keychars/chacha-keypad-rus.kcm.bin \
    device/htc/chacha/key/chacha-keypad-rus.kl:system/usr/keylayout/chacha-keypad-rus.kl \
    device/htc/chacha/key/chacha-keypad-steng.kcm.bin:system/usr/keychars/chacha-keypad-steng.kcm.bin \
    device/htc/chacha/key/chacha-keypad-steng.kl:system/usr/keylayout/chacha-keypad-steng.kl \
    device/htc/chacha/key/chacha-keypad-tai.kcm.bin:system/usr/keychars/chacha-keypad-tai.kcm.bin \
    device/htc/chacha/key/chacha-keypad-tai.kl:system/usr/keylayout/chacha-keypad-tai.kl \
    device/htc/chacha/key/chacha-keypad-tur.kcm.bin:system/usr/keychars/chacha-keypad-tur.kcm.bin \
    device/htc/chacha/key/chacha-keypad-tur.kl:system/usr/keylayout/chacha-keypad-tur.kl \
    device/htc/chacha/key/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

PRODUCT_COPY_FILES += \
    device/htc/chacha/init.chacha.rc:root/init.chacha.rc

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.enable.dtm=0 \
    ro.ril.hsdpa.category=8 \
    ro.ril.disable.fd.plmn.prefix=23402,23410,23411 \
    ro.ril.def.agps.mode=1 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=12 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2,gprs,ppp0 \
    wifi.interface = eth0 \
    wifi.supplicant_scan_interval=15 \
    ro.sf.lcd_density = 160 \
    ro.opengles.version=131072 \
    dalvik.vm.dexopt-data-only=1

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# # For emmc phone storage
# PRODUCT_PROPERTY_OVERRIDES += \
#     ro.phone_storage = 0

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

## (2) Also get non-open-source GSM-specific aspects if available
#$(call inherit-product-if-exists, vendor/htc/liberty/liberty-vendor.mk)

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
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
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

PRODUCT_PACKAGES += \
    librs_jni \
    gralloc.msm7k \
    libOmxCore \
    copybit.msm7k \
    lights.chacha \
    com.android.future.usb.accessory

#PRODUCT_PACKAGES += \
#    gps.chacha 

PRODUCT_COPY_FILES += \
    device/htc/chacha/vold.fstab:system/etc/vold.fstab \
    device/common/gps/gps.conf_US:system/etc/gps.conf 

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/chacha/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Prebuilt Modules
PRODUCT_COPY_FILES += \
    device/htc/chacha/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/chacha/firmware/BCM4329B1_002.002.023.0831.0841.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/chacha/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/chacha/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

PRODUCT_COPY_FILES += \
    device/htc/chacha/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    vendor/htc/chacha/proprietary/libcamera.so:obj/lib/libcamera.so

# All the blobs necessary for chacha
PRODUCT_COPY_FILES += \
    vendor/htc/chacha/proprietary/akmd:/system/bin/akmd \
    vendor/htc/chacha/proprietary/awb_camera:/system/bin/awb_camera \
    vendor/htc/chacha/proprietary/lsc_camera:/system/bin/lsc_camera \
    vendor/htc/chacha/proprietary/AudioFilter.csv:/system/etc/AudioFilter.csv \
    vendor/htc/chacha/proprietary/AudioPara4.csv:/system/etc/AudioPara4.csv \
    vendor/htc/chacha/proprietary/AudioPara4_WB.csv:/system/etc/AudioPara4_WB.csv \
    vendor/htc/chacha/proprietary/AudioPreProcess.csv:/system/etc/AudioPreProcess.csv \
    vendor/htc/chacha/proprietary/WPDB.zip:/system/etc/WPDB.zip \
    vendor/htc/chacha/proprietary/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \
    vendor/htc/chacha/proprietary/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw \
    vendor/htc/chacha/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    vendor/htc/chacha/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/htc/chacha/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    vendor/htc/chacha/proprietary/libmm-adspsvc.so:/system/lib/libmm-adspsvc.so \
    vendor/htc/chacha/proprietary/libOmxH264Dec.so:/system/lib/libOmxH264Dec.so \
    vendor/htc/chacha/proprietary/libOmxMpeg4Dec.so:/system/lib/libOmxMpeg4Dec.so \
    vendor/htc/chacha/proprietary/libOmxVidEnc.so:/system/lib/libOmxVidEnc.so \
    vendor/htc/chacha/proprietary/libcamera.so:/system/lib/libcamera.so \
    vendor/htc/chacha/proprietary/libgsl.so:/system/lib/libgsl.so \
    vendor/htc/chacha/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \
    vendor/htc/chacha/proprietary/libaudioeq.so:/system/lib/libaudioeq.so \
    vendor/htc/chacha/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \
    vendor/htc/chacha/proprietary/gps.chacha.so:system/lib/hw/gps.chacha.so \
    vendor/htc/chacha/proprietary/sensors.chacha.so:system/lib/hw/sensors.chacha.so \
    vendor/htc/chacha/proprietary/liboemcamera.so:/system/lib/liboemcamera.so \
    vendor/htc/chacha/proprietary/libcameraservice.so:/system/lib/libcameraservice.so

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := generic_chacha
PRODUCT_DEVICE := chacha

DISABLE_DEXPREOPT := false
