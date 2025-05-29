#!/usr/bin/env bash
set -euo pipefail

echo "[*] Bootstrapping dotfiles setup for user jon..."

# Step 1: Install Nix if not already installed
if ! command -v nix &> /dev/null; then
  echo "[*] Installing Nix..."
  curl -L https://nixos.org/nix/install | sh
  # shellcheck source=/dev/null
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
else
  echo "[✓] Nix already installed."
fi

# Step 2: Enable flakes
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
echo "[*] Enabled flakes in nix config."

# Step 3: Determine system
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     system="x86_64-linux";;
    Darwin*)    
        arch_name="$(uname -m)"
        if [[ "$arch_name" == "arm64" ]]; then
            system="aarch64-darwin"
        else
            system="x86_64-darwin"
        fi
        ;;
    *)          
        echo "[!] Unsupported OS: ${unameOut}"
        exit 1
        ;;
esac
echo "[*] Detected system: $system"

# Step 4: Run Home Manager activation package
echo "[*] Activating Home Manager configuration..."
nix run ".#homeConfigurations.${system}.jon.activationPackage"

echo "[✓] Setup complete."

