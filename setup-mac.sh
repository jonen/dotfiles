#!/usr/bin/env bash

set -e

function info {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

function prompt_platform {
  echo "Which platform are you setting up?"
  select opt in "ARM (Jons-Macbook-Pro)" "ARM (Jons-Work-Macbook)"; do
    case $REPLY in
      1)
        DARWIN_CONFIG="Jons-MacBook-Pro"
        HOME_CONFIG="jon"
        break
        ;;
      2)
        DARWIN_CONFIG="Jons-Work-Macbook"
        HOME_CONFIG="jon"
        break
        ;;
      *)
        echo "Please choose."
        ;;
    esac
  done
}

# 1. Install Nix package manager if not already present
info "Checking for Nix..."
if ! command -v nix >/dev/null 2>&1; then
  info "Installing Nix using Determinate Systems installer..."
  curl -L https://install.determinate.systems/nix | sh -s -- install
  info "Nix installed. You may need to restart your terminal or run '. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'"
else
  info "Nix is already installed."
fi

# 2. Ensure nix-daemon is running (for multi-user mode on macOS)
info "Trying to start/restart nix-daemon..."
sudo launchctl kickstart -k system/org.nixos.nix-daemon

# 3. Change directory to the repo location (assumed to be the script's directory)
cd "$(dirname "$0")"

# 4. Ensure Homebrew is installed BEFORE running nix-darwin switch
if ! command -v brew >/dev/null 2>&1; then
  info "Homebrew not found, installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  info "Homebrew is already installed."
fi

# 5. Prompt user for platform choice (ARM hosts)
prompt_platform

# 6. Apply the Darwin configuration for the selected platform
info "Applying your Nix/Darwin flake for $DARWIN_CONFIG (system configuration)..."
sudo nix --extra-experimental-features 'nix-command flakes' \
  run github:nix-darwin/nix-darwin -- switch --flake .#"$DARWIN_CONFIG"

info "Nix Darwin system configuration for $DARWIN_CONFIG applied via flake."

# 7. Apply the Home Manager configuration for the selected platform
info "Applying your Home Manager flake for $HOME_CONFIG (user configuration)..."
nix --extra-experimental-features nix-command --extra-experimental-features flakes run home-manager/release-25.05 -- switch --flake .#"$HOME_CONFIG"

info "Home Manager configuration for $HOME_CONFIG applied via flake."

info "Setup complete! Your Mac is configured according to your flake and user configs."
