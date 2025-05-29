#!/usr/bin/env bash
set -euo pipefail

# Install Nix if not already installed
if ! command -v nix &> /dev/null; then
  echo "Installing Nix..."
  curl -L https://nixos.org/nix/install | sh
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Enable flakes
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' > ~/.config/nix/nix.conf

# Run Home Manager
nix run .#homeConfigurations.jon.activationPackage

