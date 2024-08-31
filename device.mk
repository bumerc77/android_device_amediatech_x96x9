# Copyright (C) 2021-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## TEE
TARGET_HAS_TEE := false

## Factory
PRODUCT_HOST_PACKAGES += \
    aml_image_packer

## Bluetooth
BOARD_HAVE_BLUETOOTH := true
PRODUCT_PACKAGES += \
    X96x9BluetoothOverlay \
    libbt-vendor

## Init-Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/init.amlogic.wifi_buildin.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.wifi_buildin.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.vfd_display.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.vfd_display.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.optimize.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.optimize.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.wifi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.wifi.rc

## WiFi Modules
TARGET_DHD_VERSION := bcmdhd.100.10.545.x

PRODUCT_PACKAGES += \
    dhd
    
## Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

ifneq ($(PRODUCT_USE_SW_OMX),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
endif
    
## VFD Display
DEBUG_VFD := true    
PRODUCT_PACKAGES += \
    openvfd \
    YAopenvfD
    
# SOC
TARGET_AMLOGIC_SOC := g12b
TARGET_BOARD_PLATFORM := g12b
TARGET_USES_P_MODULES := true

$(call inherit-product, device/amlogic/gx-common/gx.mk)
$(call inherit-product, vendor/amediatech/x96x9/x96x9-vendor.mk)
