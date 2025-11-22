#!/bin/sh

# Detect if run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root (e.g. sudo sh install.sh)"
    exit 1
fi

# Download repository key (used by both Alpine and Chimera)
# The key must be named to match the signature: builduser-68fcd79c.rsa.pub
wget -O /etc/apk/keys/builduser-68fcd79c.rsa.pub https://xlibre-alpine.github.io/website/main/builduser-68fcd79c.rsa.pub

# Enable community repository (required for dependencies like libxfont2 and libxcvt)
if grep -qi '^ID=alpine' /etc/os-release; then
    # Detect Alpine version
    ALPINE_VERSION=$(grep VERSION_ID /etc/os-release | cut -d'"' -f2 | cut -d'.' -f1,2)
    if [ -z "$ALPINE_VERSION" ]; then
        ALPINE_VERSION="v3.22"  # Default fallback
    else
        ALPINE_VERSION="v$ALPINE_VERSION"
    fi
    COMMUNITY_REPO="http://dl-cdn.alpinelinux.org/alpine/$ALPINE_VERSION/community"
    
    # Enable community repo if not already enabled
    if ! grep -q "^$COMMUNITY_REPO" /etc/apk/repositories && ! grep -q "^#$COMMUNITY_REPO" /etc/apk/repositories; then
        echo "Adding community repository: $COMMUNITY_REPO"
        echo "$COMMUNITY_REPO" >> /etc/apk/repositories
    elif grep -q "^#$COMMUNITY_REPO" /etc/apk/repositories; then
        echo "Enabling community repository: $COMMUNITY_REPO"
        sed -i "s|^#$COMMUNITY_REPO|$COMMUNITY_REPO|" /etc/apk/repositories
    else
        echo "Community repository already enabled"
    fi
fi

# Detect distribution
if grep -qi 'ID="chimera"' /etc/os-release; then
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
