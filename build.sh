#!/bin/bash

# Repo Init
repo init -u https://github.com/ProjectPixelage/android_manifest.git -b 15 --git-lfs

# Sync the repositories
/opt/crave/resync.sh

# Remove existing directories

rm -rf device/oneplus/fajita
rm -rf device/oneplus/sdm845-common
rm -rf vendor/oneplus/fajita
rm -rf vendor/oneplus/sdm845-common
rm -rf kernel/oneplus/sdm845
rm -rf hardware/oneplus
rm -rf hardware/qcom-caf/sdm845/media
rm -rf hardware/qcom-caf/sdm845/audio
rm -rf hardware/qcom-caf/sdm845/display
rm -rf device/lineage/sepolicy
rm -rf device/qcom/sepolicy_vndr/legacy-um
rm -rf frameworks/native
rm -rf frameworks/base
rm -rf hardware/qcom-caf/bootctrl
rm -rf external/libhybris
rm -rf vendor/lindroid
rm -rf external/lxc

# Clone repositories #
# Clang
git clone https://gitlab.com/kei-space/clang/r522817 prebuilts/clang/host/linux-x86/

# Device
git clone https://github.com/shinichi-c/android_device_oneplus_fajita_15 --depth=1 -b lindroid device/oneplus/fajita
git clone https://github.com/shinichi-c/android_device_oneplus_sdm845-common_15 --depth=1 -b bootctrl device/oneplus/sdm845-common

# Vendor
git clone https://github.com/TheMuppets/proprietary_vendor_oneplus_fajita --depth=1 -b lineage-22.0 vendor/oneplus/fajita
git clone https://github.com/shinichi-c/proprietary_vendor_oneplus_sdm845-common --depth=1 -b elf_checks vendor/oneplus/sdm845-common

# Kernel
git clone https://github.com/Terminator-J/crdroid_kernel_oneplus_sdm845 --depth=1 -b 14.0-4.19-test2 kernel/oneplus/sdm845

# Hardware
git clone https://github.com/shinichi-c/android_hardware_oneplus --depth=1 -b pixelage hardware/oneplus

# Hals
git clone https://github.com/shinichi-c/media --depth=1 -b upstream hardware/qcom-caf/sdm845/media
git clone https://github.com/shinichi-c/audio --depth=1 -b pixelage hardware/qcom-caf/sdm845/audio
git clone https://github.com/shinichi-c/display --depth=1 -b upstream hardware/qcom-caf/sdm845/display

# Sepolicy
git clone https://github.com/shinichi-c/android_device_pixelage_sepolicy --depth=1 device/lineage/sepolicy
git clone https://github.com/shinichi-c/android_device_qcom_sepolicy_vndr --depth=1 -b lineage-22.2-legacy-um device/qcom/sepolicy_vndr/legacy-um

# framework
git clone https://github.com/shinichi-c/android_frameworks_native_pixelage --depth=1 -b 15-Qpr2 frameworks/native
git clone https://github.com/shinichi-c/android_frameworks_base_pixelage --depth=1 -b revert frameworks/base

# bootctrl
git clone https://github.com/shinichi-c/android_hardware_qcom_bootctrl --depth=1 -b lineage-22.2-caf hardware/qcom-caf/bootctrl

# lindroid
git clone https://github.com/shinichi-c/libhybris --depth=1 -b lindroid-21 external/libhybris
git clone https://github.com/shinichi-c/vendor_lindroid --depth=1 -b lindroid-22.1 vendor/lindroid
git clone https://github.com/Linux-on-droid/external_lxc --depth=1 -b lindroid-21 external/lxc

# Lunch
export PIXELAGE_BUILD="fajita"
source build/envsetup.sh
lunch pixelage_fajita-bp1a-userdebug
make installclean
mka bacon
