#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Additional repos
echo "Installing Terra"
curl -fsSL https://github.com/terrapkg/subatomic-repos/raw/main/terra.repo | tee /etc/yum.repos.d/terra.repo
rpm-ostree install terra-release

### Install packages

echo "Downloading packages"

# ProtonMail Desktop
wget https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm
wget -O warp.rpm https://app.warp.dev/download?package=rpm



echo "Installing local packages"
# Warp Terminal
rpm-ostree install warp.rpm
rpm-ostree install ProtonMail-desktop-beta.rpm

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

echo "Installing Fedora packages..."

# this installs a package from fedora repos
rpm-ostree install fira-code-fonts python3-pip zed arc-theme

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
