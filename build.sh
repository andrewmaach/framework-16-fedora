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

# Android SDK tools installation
echo "Installing Android SDK tools..."

# Create Android SDK directory
mkdir -p /usr/share/android-sdk
cd /usr/share/android-sdk

# Download Android command line tools
CMDLINE_TOOLS_VERSION="13114758"
wget -q https://dl.google.com/android/repository/commandlinetools-linux-${CMDLINE_TOOLS_VERSION}_latest.zip -O cmdline-tools.zip
unzip -q cmdline-tools.zip
rm cmdline-tools.zip

# Move cmdline-tools to the correct location
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true

# Accept licenses and install essential SDK components
yes | cmdline-tools/latest/bin/sdkmanager --licenses >/dev/null 2>&1 || true
cmdline-tools/latest/bin/sdkmanager "platform-tools" "emulator" "build-tools;34.0.0" "platforms;android-34" "system-images;android-34;google_apis;x86_64"

# Set proper permissions
chmod -R 755 /opt/android-sdk


#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable docker.socket
