#!/bin/bash
# L4T belgelerindeki "Setting Up Your Host" bölümüne bakın.
set -e
cd `dirname $0`
source ./downloadfilenames

echo "L4T Sürücü Paketi ayıklanıyor..."
sudo tar xpf ${L4T_RELEASE_PACKAGE}

cd Linux_for_Tegra/rootfs/
echo "Örnek Kök Dosya Sistemi ayıklanıyor..."
sudo tar xpf ${SAMPLE_FS_PACKAGE}
cd ..

echo "NVIDIA ikili dosyaları uygulanıyor..."
sudo ./apply_binaries.sh

echo "Kurulum için ön koşullar yükleniyor..."
sudo ./tools/l4t_flash_prerequisites.sh