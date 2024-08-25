#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

wget https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm
rpm-ostree install ProtonMail-desktop-beta.rpm
rm ProtonMail-desktop-beta.rpm zoom_x86_64.rpm

curl -f https://zed.dev/install.sh | sh


# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install fira-code-fonts python3-pip containerd.io podman-compose docker-compose-plugin

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
