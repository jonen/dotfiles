#!/usr/bin/env bash

set -euo pipefail

RAW_HOSTNAME=$(scutil --get HostName || hostname)
HOSTNAME=$(echo "$RAW_HOSTNAME" | sed 's/\.local$//')

FLAKE_PATH="/Users/jon/dotfiles"
FLAKE="${FLAKE_PATH}#${HOSTNAME}"

echo "🖥️ Detected hostname: $RAW_HOSTNAME"
echo "🔍 Using hostname for flake: $HOSTNAME"
echo "📦 Flake path: $FLAKE"

echo "🧪 Checking if flake has configuration for host: $HOSTNAME..."
AVAILABLE_HOSTS=$(nix eval --raw "$FLAKE_PATH#darwinConfigurations" | jq -r 'keys[]')

if ! echo "$AVAILABLE_HOSTS" | grep -q "^$HOSTNAME$"; then
  echo "❌ No darwin configuration found for hostname: $HOSTNAME"
  echo "📋 Available configurations:"
  echo "$AVAILABLE_HOSTS"
  echo
  read -rp "⚠️ Do you want to continue anyway? [y/N] " CONT
  if [[ ! "$CONT" =~ ^[Yy]$ ]]; then
    echo "👋 Exiting setup."
    exit 1
  fi
fi

if ! command -v nix >/dev/null 2>&1; then
  echo "📥 Installing Nix..."
  curl -L https://nixos.org/nix/install | sh
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
else
  echo "✅ Nix is already installed."
fi

echo "⚙️ Enabling flakes and nix-command..."
mkdir -p ~/.config/nix
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF

if ! command -v darwin-rebuild >/dev/null 2>&1; then
  echo "📦 Installing darwin-rebuild..."
  nix profile install nixpkgs#darwin-rebuild
fi

echo "🔧 Running darwin-rebuild switch with flake: $FLAKE"
darwin-rebuild switch --flake "$FLAKE"

echo "✅ Setup complete for host: $HOSTNAME"
echo "🔁 Please restart your terminal session."
