#!/bin/bash
# "Burning PKC Fuses" talimatlarına bakın
cd `dirname $0`
keyfile=rsa_priv.pem
if [ ! -e ${keyfile} ]; then
    echo "Lütfen ${keyfile} yolunda bir RSA özel anahtar dosyası oluşturun."
    exit 1
fi
read -p "Bu cihazdaki PKC sigortasını yakmak istediğinizden emin misiniz? BU İŞLEM GERİ ALINAMAZ. Devam etmek için y tuşuna basın:" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    set -e
    echo "PKC sigortası yakılıyor, JTAG etkin bırakılıyor"
    cd Linux_for_Tegra
    # Jetson AGX Xavier için çip kimliği 0x19 ve hedef kart adı jetson-agx-xavier-devkit
    sudo ./odmfuse.sh -j -i 0x19 -c PKC -p -k ../${keyfile} jetson-agx-xavier-devkit
fi