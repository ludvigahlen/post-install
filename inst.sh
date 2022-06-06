#! /bin/bash
# -*- ENCODING: UTF-8 -*-

apt update && apt upgrade

usermod -aG sudo ldvg

apt install sudo -y
apt install gnome-core -y
apt install chromium -y 
wget https://cdimage.debian.org/cdimage/unofficial/non-free/firmware/bullseye/current/firmware.tar.gz -O - | sudo tar -xz
sudo dpkg -i firmware-iwlwifi_20210315-3_all.deb
sudo rm -r *.deb -f
nmcli d wifi connect M28A password $1

apt install -y git

# code, pwsh
apt install -y gnupg2 software-properties-common apt-transport-https curl
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list
apt update
apt install -y code powershell

# nas
apt install -y nfs-common
mkdir /mnt/pve && mkdir /mnt/omv && mkdir /mnt/storage
echo "192.168.101.2:/volume2/pve	/mnt/pve	nfs	defaults	0	0" >> /etc/fstab
echo "192.168.101.3:/export/OMV	/mnt/omv	nfs	defaults	0	0" >> /etc/fstab
echo "192.168.101.2:/volume2/Storage	/mnt/storage	nfs	defaults	0	0" >> /etc/fstab
mount /mnt/pve && mount /mnt/omv && mount /mnt/storage
