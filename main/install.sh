#!/bin/sh

# Detect if run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root (e.g. sudo sh install.sh)"
    exit 1
fi

# Download repository key (used by both Alpine and Chimera)
wget -O /etc/apk/keys/xlibre.rsa.pub https://xlibre-alpine.github.io/website/main/xlibre.rsa.pub

# Detect distribution
if grep -qi 'ID=chimera' /etc/os-release; then
    echo "Detected Chimera Linux"
    REPO_URL="https://xlibre-alpine.github.io/website/chimera/main"
elif grep -qi '^ID=alpine' /etc/os-release; then
    echo "Detected Alpine Linux"
    REPO_URL="https://xlibre-alpine.github.io/website/main"
else
    echo "Could not detect Alpine or Chimera Linux in /etc/os-release. It's likely you are not using Alpine or Chimera Linux."
    exit 1
fi

# Add repository if it does not exist
if ! grep -q "$REPO_URL" /etc/apk/repositories; then
    echo "Adding $REPO_URL to /etc/apk/repositories"
    echo "$REPO_URL" >> /etc/apk/repositories
else
    echo "Repository URL already present in /etc/apk/repositories"
fi

echo "Updating APK index"
apk update

echo "You can now install X11Libre with: apk add xlibre-xserver"
