# Jon's Dotfiles

## Nix + nix-darwin + Home Manager Setup

This repository contains my macOS configuration managed with Nix flakes, nix-darwin, and Home Manager.
It bootstraps Apple Silicon Macs, installs system and user packages, fonts, apps via Homebrew and the Mac App Store, and links my dotfiles.

## Overview

- Flake targets:
    - darwinConfigurations:
        - Jons-MacBook-Pro (Apple Silicon, aarch64-darwin)
        - Jons-Work-MacBook (Apple Silicon, aarch64-darwin)
    - homeConfigurations:
        - jon (Apple Silicon)
- System layer (nix-darwin):
    - Nix settings (flakes enabled, GC, optimise)
    - Primary user: jon with zsh
    - System packages from nix-packages.nix
    - Homebrew casks + MAS apps from homebrew-packages.nix
    - Fonts via fonts-packages.nix
- User layer (Home Manager):
    - Home state version: 24.05
    - Dotfiles and app configs linked into $HOME
    - Adds home-manager to PATH

## Prerequisites

- macOS with admin access
- Internet connection
- You may be prompted for sudo during setup
- Optional: Xcode Command Line Tools if Homebrew asks for them

## Quick Start

1) Clone the repo

2) Run the bootstrap script
    - chmod +x ./setup-mac.sh
    - ./setup-mac.sh
    - Choose your platform when prompted:
        - 2 = ARM (Jons-MacBook-Pro / jon)
        - 3 = ARM (Jons-Work-Macbook / jon)
    - What it does:
        - Installs Nix via Determinate Systems installer if missing
        - Restarts nix-daemon
        - Installs Homebrew if missing
        - Applies nix-darwin system configuration for the selected host
        - Applies Home Manager user configuration

## Flake Structure

- flake.nix
    - Pins:
        - nixpkgs: nixpkgs-unstable
        - nix-darwin: main branch (unstable)
        - home-manager: master branch (unstable)
    - Exposes:
        - darwinConfigurations."Jons-MacBook-Pro" (aarch64-darwin)
        - darwinConfigurations."Jons-Work-MacBook" (aarch64-darwin)
        - homeConfigurations."jon"
- configuration.nix (nix-darwin)
    - Enables nix-command and flakes
    - Automatic GC and optimisation
    - Sets system.stateVersion = 6
    - Primary user jon with zsh shell
    - Imports:
        - environment.systemPackages from nix-packages.nix
        - homebrew from homebrew-packages.nix
        - fonts.packages from fonts-packages.nix
- home.nix (Home Manager)
    - home.username = "jon", homeDirectory = "/Users/jon", stateVersion = "24.05"
    - Installs pkgs.home-manager
    - Manages dotfiles and app configs:
        - ./lazygit/dot-config/lazygit -> ~/.config/lazygit
        - ./yazi/dot-config/yazi -> ~/.config/yazi
        - ./nvim/dot-config/nvim -> ~/.config/nvim
        - ./kitty/dot-config/kitty -> ~/.config/kitty
        - ./btop/dot-config/btop -> ~/.config/btop
        - ./bat/dot-config/bat -> ~/.config/bat
        - Out-of-store symlinks into external dotfiles repo at /Users/jon/dotfiles:
            - ~/.bashrc -> bash/dot-bashrc
            - ~/.config/tmux/tmux.conf -> tmux/dot-config/tmux/tmux.conf
            - ~/.inputrc -> zsh/dot-inputrc
            - ~/.zprofile -> zsh/dot-zprofile
            - ~/.gitconfig -> git/dot-gitconfig
            - ~/.gitignore_global -> git/dot-gitignore_global
            - ./ghostty/dot-config/ghostty -> ~/.config/ghostty
            - ~/.zshrc -> zsh/dot-zshrc
            - ~/.config/starship.toml -> starship/dot-config/starship.toml
            - ~/.local/bin/oil-ssh.sh -> scripts/dot-local/bin/oil-ssh.sh
    - Note: Requires your dotfiles repo at /Users/jon/dotfiles. Update the path or place your repo there.
- nix-packages.nix
    - CLI tools: neovim, bat, btop, eza, fastfetch, fd, fzf, git, gnupg, htop, lazygit, mediainfo, nixfmt-rfc-style, nodejs_24, python313, ripgrep, speedtest-cli, starship, stow, tailscale, tmux, ueberzugpp, uv, yazi, yt-dlp, zoxide, delta
- homebrew-packages.nix
    - brews: mas
    - casks: vlc, witsy, shortcat, raycast, ghostty, 1password, 1password-cli, readest, tailscale-app, brave-browser, obsidian, visual-studio-code
    - MAS apps: Infuse, 1Password for Safari, Consent-O-Matic, Obsidian Web Clipper, SponsorBlock, uBlock Origin Lite
- fonts-packages.nix
    - nerd-fonts.meslo-lg

## Common Commands

- Switch system configuration manually:
    - sudo nix --extra-experimental-features 'nix-command flakes' run github:nix-darwin/nix-darwin -- switch --flake .
    - Swap the host suffix for `Jons-MacBook-Pro` or `Jons-Work-MacBook` when targeting those machines.
- Switch Home Manager profile:
    - home-manager switch --flake .#jon
- Garbage collect and optimise:
    - sudo nix store optimise
    - sudo nix-collect-garbage -d
    - nix-collect-garbage -d

## Known Caveats

- First Nix install on macOS:
    - You might need to restart your shell or source the daemon profile:
        - . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
- Homebrew:
    - Some casks and MAS apps may require manual login or permissions on first launch.

## Updating

- Update inputs:
    - nix flake update
- Rebuild:
    - Apply nix-darwin and Home Manager switches as above
- Check nix-darwin changes:
    - darwin-rebuild changelog

## Uninstall or Rollback

- Roll back to previous generation:
    - darwin-rebuild rollback
    - home-manager generations
- Uninstall Nix (if needed):
    - Follow the Determinate Systems or official Nix uninstall instructions

## Troubleshooting

- Flake resolution errors:
    - Ensure you have flakes enabled and network connectivity
- Permission issues:
    - Re-run commands with sudo where required for system-level changes
- MAS installs failing:
    - Sign in to App Store first and ensure mas is installed via Homebrew
- Symlink errors for out-of-store files:
    - Confirm the target files exist in /Users/jon/dotfiles
    - Home Manager will fail if the source is missing

## License

- Personal configuration. Reuse at your own risk.
