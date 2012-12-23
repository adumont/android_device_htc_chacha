TEAM_PRODUCT := chacha
TINY_GAAPS := true

# Inherit some common OSR stuff.
$(call inherit-product, vendor/osr/config/medium_phone.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, vendor/osr/config/flash.mk)
$(call inherit-product, vendor/google/essencial.mk)
$(call inherit-product, vendor/google/products/talk_support.mk)
$(call inherit-product, vendor/google/products/voicesearch_support.mk)
$(call inherit-product, vendor/google/products/music_support.mk)

# Inherit device configuration
$(call inherit-product, device/htc/chacha/chacha.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := chacha
PRODUCT_NAME := osr_chacha
PRODUCT_BRAND := HTC
PRODUCT_MODEL := HTC Chacha A810
PRODUCT_MANUFACTURER := HTC

ifdef BUILD_TAG
   BUILD_ID := $(shell date -u +%Y%m%d)
else
   BUILD_ID := $(shell date -u +%Y%m%d)-$(BUILD_TAG)
endif

PRODUCT_VERSION_DEVICE_RELEASE := ALPHA
PRODUCT_VERSION_DEVICE_SPECIFIC := $(PRODUCT_VERSION_DEVICE_RELEASE)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_chacha BUILD_ID=$(BUILD_ID) BUILD_DISPLAY_ID=$(BUILD_ID) BUILD_FINGERPRINT=cyanogenmod/htc_chacha/chacha:4.1.1/$(BUILD_ID)/0.1:user/release-keys PRIVATE_BUILD_DESC="2.13.401.2 CL197017 release-keys"

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
    mdpi
