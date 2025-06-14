#!/bin/bash
# Bu betik, standart (imzasız) Jetson Linux imajını NVMe sürücüsüne kurar.
# Cihazınızın Kurtarma Modunda (Recovery Mode) olduğundan emin olun.
set -e
cd `dirname $0`
cd Linux_for_Tegra

# NVMe sürücüsü için /dev/nvme0n1 varsayılmıştır.
# --external-device parametresiyle farklı bir sürücü belirtebilirsiniz.
# Kurulum sonrası Jetson üzerinde oluşturulacak kullanıcı adı ve şifreyi burada belirtin.
# Değiştirmeniz önerilir.
JETSON_USER="nvidia"
JETSON_PASS="nvidia"

echo "Jetson AGX Xavier NVMe SSD'ye imaj yazdırılıyor..."

sudo ./tools/kernel_flash/l4t_initrd_flash.sh --external-device nvme0n1p1 \
  -c tools/kernel_flash/flash_l4t_external.xml \
  -p "-c bootloader/t186ref/cfg/flash_t194_qspi_p3618.xml" \
  --showlogs --network usb0 \
  -u ../rsa_priv.pem \
  --user-name "${JETSON_USER}" --user-password "${JETSON_PASS}" \
  jetson-agx-xavier-devkit