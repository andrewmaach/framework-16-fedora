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
    arc-theme \
    containerd.io \
    fish \
    gcc \
    postgresql \
    docker-ce \
    docker-ce-cli \
    docker-buildx-plugin \
    gcc \
    librewolf \
    microsoft-edge-stable \
    mako \
    nodejs \
    npm \
    wget \
    git \
    java-21-openjdk-headless \
    java-21-openjdk-devel \
    ncurses-compat-libs

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable docker.socket
