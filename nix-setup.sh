#!/usr/bin/env bash

set -euo pipefail

RAW_HOSTNAME=$(scutil --get LocalHostName || hostname)
HOSTNAME=$(echo "$RAW_HOSTNAME" | sed 's/\.local$//')

FLAKE_PATH="/Users/jon/dotfiles"
FLAKE="${FLAKE_PATH}#${HOSTNAME}"

echo "🖥️ Detected hostname: $RAW_HOSTNAME"
echo "🔍 Using hostname for flake: $HOSTNAME"
echo "📦 Flake path: $FLAKE"

if ! command -v nix >/dev/null 2>&1; then
    echo "📥 Installing Nix..."
    curl -L https://nixos.org/nix/install | sh
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
else
    echo "✅ Nix is already installed."
fi

if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ homebrew is already installed."
fi

if ! command -v darwin-rebuild >/dev/null 2>&1; then
    echo "📦 Installing nix-darwin..."
    sudo NIX_CONFIG="experimental-features = nix-command flakes" nix run github:LnL7/nix-darwin -- switch --flake .
fi

bat cache --build

echo "✅ Setup complete for host: $HOSTNAME"
echo "🔁 Please restart your terminal session."
