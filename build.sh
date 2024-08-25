#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages


# ProtonMail Desktop
wget https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm
rpm-ostree install ProtonMail-desktop-beta.rpm
rm ProtonMail-desktop-beta.rpm


# Zed text editor
wget https://zed.dev/api/releases/stable/latest/zed-linux-x86_64.tar.gz
tar -xvf zed-linux-x86_64.tar.gz -C /opt
ln -sf /opt/zed.app/bin/zed /bin/zed
rm zed-linux-x86_64.tar.gz
cp /opt/zed.app/share/applications/zed.desktop /usr/share/applications/dev.zed.Zed.desktop
sed -i "s|Icon=zed|Icon=/opt/zed.app/share/icons/hicolor/512x512/apps/zed.png|g" /usr/share/applications/dev.zed.Zed.desktop
sed -i "s|Exec=zed|Exec=/opt/zed.app/libexec/zed-editor|g" /usr/share/applications/dev.zed.Zed.desktop

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install fira-code-fonts python3-pip

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
