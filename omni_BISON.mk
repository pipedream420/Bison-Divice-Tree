#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from BISON device
$(call inherit-product, device/hxy/BISON/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/omni/config/gsm.mk)

PRODUCT_COPY_FILES += device/HXY/BISON/prebuilt/Image.gz:kernel
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/*:root/*

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := BISON
PRODUCT_NAME := omni_BISON
PRODUCT_BRAND := UMIDIGI
PRODUCT_MODEL := BISON
PRODUCT_MANUFACTURER := HXY
PRODUCT_RELEASE_NAME := UMIDIGI BISON

# enable stock zip packages flash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    persist.sys.usb.config=mtp \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.allow.mock.location=0
    
    # Add fingerprint from Stock ROM build.prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="UMIDIGI/BISON/BISON:10/QP1A.190711.020/2010082016:user/release-keys" \
    PRIVATE_BUILD_DESC="full_g2033upt_v1_ga_ym_bison_q-user 10 QP1A.190711.0202010082016release-keys"
