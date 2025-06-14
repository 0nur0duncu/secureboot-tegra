#!/bin/bash
cd `dirname $0`
set -e
source ./downloadfilenames
mkdir -p ${DOWNLOADS_DIR}
pushd ${DOWNLOADS_DIR}

# ÖNEMLİ: Bu URL'ler NVIDIA tarafından değiştirilebilir.
# Başarısız olursa Jetson Linux Arşivi'nden güncel linkleri kontrol edin:
# https://developer.nvidia.com/embedded/jetson-linux-archive

if [ ! -f ${L4T_RELEASE_PACKAGE_NAME} ]; then
    echo "L4T Sürücü Paketi indiriliyor: ${L4T_RELEASE_PACKAGE_NAME}"
    wget https://developer.nvidia.com/downloads/embedded/l4t/r35_release_v5.0/release/jetson_linux_r35.5.0_aarch64.tbz2 -O ${L4T_RELEASE_PACKAGE_NAME}
fi

if [ ! -f ${SAMPLE_FS_PACKAGE_NAME} ]; then
    echo "Örnek Kök Dosya Sistemi indiriliyor: ${SAMPLE_FS_PACKAGE_NAME}"
    wget https://developer.nvidia.com/downloads/embedded/l4t/r35_release_v5.0/release/tegra_linux_sample-root-filesystem_r35.5.0_aarch64.tbz2 -O ${SAMPLE_FS_PACKAGE_NAME}
fi
popd

# preparing-for-use.sh artık bu betiğin içinden çağrılabilir
./preparing-for-use.sh