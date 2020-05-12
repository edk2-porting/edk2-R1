#!/bin/bash
# based on the instructions from edk2-platform
echo cleanning BuidFiles
rm -rf workspace/*
echo Done.
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p R1Pkg/R1Pkg.dsc
gzip -c < workspace/Build/R1Pkg/DEBUG_GCC5/FV/R1PKG_UEFI.fd >uefi.img
cat r1.dtb >>uefi.img
#rm -rf /mnt/hgfs/HostWorkSpaces/ADB/platform-tools/uefi.img
#cp uefi.img /mnt/hgfs/HostWorkSpaces/ADB/platform-tools/
