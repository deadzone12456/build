#!/bin/bash

rm -rf prebuilts/clang/host/linux-x86

# Repo Init
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs

# Sync the repositories
/opt/crave/resync.sh

# Remove existing directories

rm -rf device/oneplus/fajita
rm -rf device/oneplus/sdm845-common
rm -rf vendor/oneplus/fajita
rm -rf vendor/oneplus/sdm845-common
rm -rf kernel/oneplus/sdm845
rm -rf hardware/oneplus
rm -rf hardware/qcom-caf/sdm845/audio
rm -rf hardware/qcom-caf/sm8250/audio
rm -rf hardware/qcom-caf/sm8250/display
rm -rf hardware/qcom-caf/sdm845-next
rm -rf device/lineage/sepolicy
rm -rf device/qcom/sepolicy_vndr/legacy-um
rm -rf hardware/qcom-caf/bootctrl
rm -rf hardware/qcom-caf/common
rm -rf external/libhybris
rm -rf vendor/lindroid
rm -rf external/lxc
rm -rf frameworks/native
rm -rf frameworks/base

# Clone repositories #

# Device
git clone https://github.com/shinichi-c/android_device_oneplus_fajita_15 --depth=1 -b Evo_16 device/oneplus/fajita
git clone https://github.com/shinichi-c/android_device_oneplus_sdm845-common_16 --depth=1 -b c2-markv1 device/oneplus/sdm845-common

# Vendor
git clone https://github.com/TheMuppets/proprietary_vendor_oneplus_fajita --depth=1 -b lineage-22.2 vendor/oneplus/fajita
git clone https://github.com/shinichi-c/proprietary_vendor_oneplus_sdm845-common --depth=1 -b c2-opcam vendor/oneplus/sdm845-common
git clone https://github.com/shinichi-c/proprietary_vendor_oneplus_camera.git --depth=1 vendor/oneplus/camera

# Kernel
git clone https://github.com/shinichi-c/android_kernel_oneplus_sdm845 --depth=1 -b sdm845-next kernel/oneplus/sdm845

# Hardware
git clone https://github.com/shinichi-c/android_hardware_oneplus --depth=1 -b lineage-23.0-opcam2 hardware/oneplus

# Hals
git clone https://github.com/shinichi-c/android_hardware_qcom_audio --depth=1 -b markv1 hardware/qcom-caf/sdm845/audio
git clone https://github.com/shinichi-c/android_hardware_qcom_audio --depth=1 -b markv1 hardware/qcom-caf/sm8250/audio
git clone https://github.com/shinichi-c/android_hardware_qcom_display --depth=1 -b markv1 hardware/qcom-caf/sm8250/display

# Sepolicy
git clone https://github.com/shinichi-c/android_device_lineage_sepolicy --depth=1 -b evox-16 device/lineage/sepolicy
git clone https://github.com/shinichi-c/android_device_qcom_sepolicy_vndr --depth=1 -b evox-16 device/qcom/sepolicy_vndr/legacy-um

# bootctrl
git clone https://github.com/shinichi-c/android_hardware_qcom_bootctrl --depth=1 -b lineage-22.2-caf hardware/qcom-caf/bootctrl

# qcom-caf_common
git clone https://github.com/shinichi-c/android_hardware_qcom-caf_common --depth=1 -b markv1 hardware/qcom-caf/common

# framework
git clone https://github.com/shinichi-c/frameworks_native_evo16 --depth=1 -b bka frameworks/native
git clone https://github.com/shinichi-c/frameworks_base_evo --depth=1 -b bka_new frameworks/base

# lindroid
git clone https://github.com/Linux-on-droid/libhybris --depth=1 -b tmp external/libhybris
git clone https://github.com/shinichi-c/vendor_lindroid --depth=1 -b lindroid-22.1 vendor/lindroid
git clone https://github.com/Linux-on-droid/external_lxc --depth=1 -b lindroid-21 external/lxc

#lunch
source build/envsetup.sh
lunch lineage_fajita-bp2a-userdebug
make installclean
m evolution
