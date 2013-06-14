#PRODUCT_RELEASE_NAME := CRYPTOMILK

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/htc/chacha/chacha.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := chacha
PRODUCT_NAME := cm_chacha
PRODUCT_BRAND := HTC
PRODUCT_MODEL := HTC Chacha A810
PRODUCT_MANUFACTURER := HTC

PRODUCT_VERSION_DEVICE_RELEASE := ALPHA0
PRODUCT_VERSION_DEVICE_SPECIFIC := -ADLX-$(PRODUCT_VERSION_DEVICE_RELEASE)

# CM_RELEASE := true
CM_BUILDTYPE := UNOFFICIAL

ifdef BUILD_TAG
   BUILD_ID := $(shell date -u +%Y%m%d)
else
   BUILD_ID := $(shell date -u +%Y%m%d)-$(BUILD_TAG)
endif

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_chacha BUILD_ID=$(BUILD_ID) BUILD_DISPLAY_ID=$(BUILD_ID) BUILD_FINGERPRINT=cyanogenmod/htc_chacha/chacha:4.2.2/$(BUILD_ID)/0.1:user/release-keys PRIVATE_BUILD_DESC="2.13.401.2 CL197017 release-keys"

PRODUCT_LOCALES := \
    en_US \
    es_ES \
    ca_ES \
    en_GB \
    de_DE \
    eu_ES \
    fr_FR \
    it_IT \
    pt_PT \
    pt_BR \
    ko_KR \
    tr_TR \
    ja_JP \
    zh_CN \
    mdpi
