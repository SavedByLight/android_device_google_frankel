#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/google/frankel

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    init_boot \
    vendor_boot \
    vendor_kernel_boot \
    dtbo \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    system \
    system_ext \
    system_dlkm \
    product \
    vendor \
    vendor_dlkm \
    modem \
    abl \
    bl1 \
    bl2 \
    bl31 \
    gsa \
    gsa_bl1 \
    gcf \
    pbl \
    pvmfw \
    tzsw \
    ldfw
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := frankel
TARGET_NO_BOOTLOADER := true
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true
TARGET_USES_UEFI := true
ENABLE_SCHEDBOOST := true

# Build Broken
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Board
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Display
TARGET_SCREEN_DENSITY := 420
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080
TARGET_USES_VULKAN := true

# Kernel
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_CMDLINE := fips140.load_sequential=1 vh_sched.load_sequential=1 arm_smmu_v3_kvm.atomic_pages=5897 spmi_smartdv.load_sequential=1 regmap-goog-spmi.load_sequential=1 max77779_pmic.load_sequential=1 max77779_pmic_spmi.load_sequential=1 max77779_pmic_pinctrl.load_sequential=1 dyndbg=&#34;func alloc_contig_dump_pages +p&#34; cma_sysfs.experimental=Y cgroup.memory=nokmem init_on_alloc=0 init_on_free=1 rcupdate.rcu_expedited=1 rcu_nocbs=all rcutree.enable_rcu_lazy swiotlb=noforce disable_dma32=on sysctl.kernel.sched_pelt_multiplier=4 aoc_core.aoc_enable_gsa_boot=1 rodata=on arm_smmu_v3_kvm.smc_s2=true kasan=off at24.write_timeout=100 log_buf_len=1024K android_arch_task_struct_size=512 bootconfig
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_SEPARATED_DTBO := true

# mkbootimg
BOARD_MKBOOTIMG_ARGS:= \
--kernel_offset=0x00008000 \
--ramdisk_offset=0x01000000 \
--tags_offset=0x00000100 \
--dtb_offset=0x01f00000 \
--header_version=$(BOARD_BOOTIMG_HEADER_VERSION) \

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 16777216
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := google_dynamic_partitions
BOARD_GOOGLE_DYNAMIC_PARTITIONS_PARTITION_LIST :=
BOARD_GOOGLE_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist

# Platform
TARGET_BOARD_PLATFORM := laguna

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/prebuilt/recovery.wipe
BOARD_RECOVERY_SNAPSHOT := false

# Security patch level
VENDOR_SECURITY_PATCH := 2026-08-05

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VENDOR_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VENDOR_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := 1
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 1

LC_ALL := C
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_CUSTOM_CPU_TEMP_PATH := /dev/thermal_cpu

TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := en
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_NO_SCREEN_BLANK := true
TW_NO_LEGACY_PROPS := true
TW_MAX_BRIGHTNESS := 3827
TW_DEFAULT_BRIGHTNESS := 219
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_FRAMERATE := 120

# TWRP Configuration - Excludes
TW_EXCLUDE_APEX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_TWRPAPP := true

# TWRP Configuration - Crypto (FBE metadata decryption via Trusty TEE KeyMint)
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 2
OF_FORCE_DATA_FORMAT_F2FS := 1

# TWRP Configuration - Includes
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true
TW_INCLUDE_LPTOOLS := true

# Vendor Boot
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

SELINUX_IGNORE_NEVERALLOWS := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_BATTERY_SYSFS_WAIT_SECONDS := 6

# Version
TW_VERSION := SavedByLight