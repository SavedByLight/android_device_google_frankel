#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from frankel device
$(call inherit-product, device/google/frankel/device.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_DEVICE := frankel
PRODUCT_NAME := twrp_frankel
PRODUCT_BRAND := google
PRODUCT_MODEL := Generic System
PRODUCT_MANUFACTURER := google

PRODUCT_GMS_CLIENTID_BASE := android-google