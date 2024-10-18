# Repo Init
repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

# Clone local_manifests repository
git clone https://github.com/deadzone12456/local_manifests_oneplus --depth 1 .repo/local_manifests

# Resync
/opt/crave/resync.sh

# Lunch
source build/envsetup.sh
lunch yaap_fajita-ap3a-userdebug
m bacon
