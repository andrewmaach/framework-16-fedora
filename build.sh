#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

echo "Downloading packages"

# ProtonMail Desktop
wget https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm

curl -s https://api.github.com/repos/zen-browser/desktop/releases/latest |  grep "/zen.linux-specific.tar.bz2" | cut -d : -f 2,3 | tr -d \" | wget -qi -

tar -xvjf zen.linux-specific.tar.bz2
mv zen /opt/

rm zen.linux-specific.tar.bz2

echo "Installing local packages"
rpm-ostree install ProtonMail-desktop-beta.rpm

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

echo "Installing Fedora packages..."

# this installs a package from fedora repos
rpm-ostree install fira-code-fonts python3-pip arc-theme nautilus docker-ce docker-ce-cli docker-buildx-plugin containerd.io

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable docker.socket
