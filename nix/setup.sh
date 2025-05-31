#!/usr/bin/env bash
set -euo pipefail

echo "👉 Starting Nix bootstrap..."

# Step 1: Install Nix if not installed
if ! command -v nix &> /dev/null; then
  echo "🔧 Installing Nix..."
  curl -L https://nixos.org/nix/install | sh
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Step 2: Enable flakes if not already set
mkdir -p ~/.config/nix
if ! grep -q "experimental-features" ~/.config/nix/nix.conf 2>/dev/null; then
  echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
fi

# Step 3: Detect system type (arch + OS)
OS="$(uname -s)"
ARCH="$(uname -m)"

case "$ARCH" in
  x86_64) NIX_ARCH="x86_64" ;;
  arm64 | aarch64) NIX_ARCH="aarch64" ;;
  *) echo "❌ Unsupported architecture: $ARCH" && exit 1 ;;
esac

case "$OS" in
  Darwin)  SYSTEM="${NIX_ARCH}-darwin" ;;
  Linux)   SYSTEM="${NIX_ARCH}-linux" ;;
  *) echo "❌ Unsupported OS: $OS" && exit 1 ;;
esac

echo "🧠 Detected system: $SYSTEM"

# Step 4: Apply system configuration
if [[ "$SYSTEM" == *darwin ]]; then
  echo "🛠 Installing nix-darwin for $SYSTEM..."
  sudo nix run github:LnL7/nix-darwin -- switch --flake ".#jon-${SYSTEM}"
elif [[ "$SYSTEM" == *linux ]]; then
  if [ -f /etc/NIXOS ]; then
    echo "🛠 Rebuilding NixOS config for $SYSTEM..."
    sudo nixos-rebuild switch --flake ".#jon-${SYSTEM}"
  else
    echo "🎯 Applying Home Manager config for non-NixOS Linux..."
    nix profile install github:nix-community/home-manager
    home-manager switch --flake ".#jon-${SYSTEM}" --impure
  fi
fi

echo "✅ Done!"

