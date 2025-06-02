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
    git

# this would install a package from rpmfusion
# rpm-ostree install vlc

# Claude Desktop installation
echo "Installing Claude Desktop..."

# Create temporary directory for build
CLAUDE_BUILD_DIR=$(mktemp -d)
cd "$CLAUDE_BUILD_DIR"

# Clone the repository
git clone https://github.com/bsneed/claude-desktop-fedora.git
cd claude-desktop-fedora

# Run the build script (without sudo since we're already root in container build)
./build-fedora.sh

# Find and install the built RPM
RPM_FILE=$(find build/electron-app/x86_64/ -name "claude-desktop*.rpm" | head -1)
if [ -f "$RPM_FILE" ]; then
    rpm-ostree install "$RPM_FILE"
    echo "Claude Desktop installed successfully!"
else
    echo "Error: Claude Desktop RPM file not found after build"
    exit 1
fi

# Cleanup
cd /
rm -rf "$CLAUDE_BUILD_DIR"

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable docker.socket
