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
    thunar \
    containerd.io \
    fish \
    gcc \
    postgresql \
    simple-scan \
    zbar \
    tesseract \
    docker-ce \
    docker-ce-cli \
    docker-buildx-plugin \
    gcc \
    librewolf \
    sway \
    waybar \
    wofi \
    swaylock \
    swayidle \
    grim \
    slurp \
    wl-clipboard \
    mako \
    foot \
    nodejs \
    npm \
    p7zip \
    p7zip-plugins \
    wget \
    icoutils \
    ImageMagick \
    rpm-build \
    git \
    java-21-openjdk-headless \
    java-21-openjdk-devel \
    ncurses-compat-libs

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable docker.socket
