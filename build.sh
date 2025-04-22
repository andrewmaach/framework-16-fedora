#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages


echo "Downloading packages"

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

echo "Installing Fedora packages..."

# this installs a package from fedora repos
rpm-ostree install \
    fira-code-fonts \
    python3-pip \
    arc-theme \
    nautilus \
    containerd.io \
    fish \
    virt-install \
    libvirt-daemon-config-network \
    libvirt-daemon-kvm \
    qemu-kvm \
    virt-manager \
    virt-viewer \
    virt-top \
    gcc \
    gnome-extensions-app \
    postgresql \
    simple-scan \
    zbar \
    tesseract \
    docker-ce \
    docker-ce-cli \
    docker-buildx-plugin \
    containerd.io \
    gnome-tweaks \
    gnome-extensions-app \
    gcc \
    librewolf

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable docker.socket
systemctl enable libvirtd
