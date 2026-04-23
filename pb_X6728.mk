#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from Infinix-X6728 device
$(call inherit-product, device/infinix/X6728/device.mk)

# Inherit some common PBRP stuff.
$(call inherit-product, vendor/pb/config/common.mk)

# Product Specifics
PRODUCT_NAME := pb_X6728
PRODUCT_DEVICE := X6728
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6728
PRODUCT_MANUFACTURER := INFINIX

PRODUCT_GMS_CLIENTID_BASE := android-infinix
