#!/bin/bash
# Bu betik, SAĞLANAN RSA ANAHTARI ile imzalanmış Jetson Linux imajını NVMe sürücüsüne kurar.
# Cihazınızın Kurtarma Modunda (Recovery Mode) olduğundan emin olun.
set -e
cd `dirname $0`
keyfile=rsa_priv.pem
if [ ! -e ${keyfile} ]; then
    echo "Lütfen ${keyfile} yolunda bir RSA özel anahtar dosyası oluşturun."
    exit 1
fi

cd Linux_for_Tegra

# Kurulum sonrası Jetson üzerinde oluşturulacak kullanıcı adı ve şifreyi burada belirtin.
JETSON_USER="nvidia"
JETSON_PASS="nvidia"

echo "Jetson AGX Xavier NVMe SSD'ye İMZALI imaj yazdırılıyor..."

sudo ./tools/kernel_flash/l4t_initrd_flash.sh --external-device nvme0n1p1 \
  -c tools/kernel_flash/flash_l4t_external.xml \
  -p "-c bootloader/t186ref/cfg/flash_t194_qspi_p3618.xml" \
  --showlogs --network usb0 \
  --user-name "${JETSON_USER}" --user-password "${JETSON_PASS}" \
  jetson-agx-xavier-devkit