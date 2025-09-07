# Jon's Dotfiles

## Overview

This repository contains configuration files and setup scripts for various applications and tools used in my development environment. It aims to streamline the installation and configuration process across different operating systems.

## Prerequisites

- **Homebrew** (for macOS)
- **Nix** (for package management)

## Nix-based installation

(macOS-only at this moment)

To set up the environment, run the following command:

```sh
bash nix-setup.sh
```

This script will:

1. Detect the hostname and set up the Nix flake accordingly.
2. Install Nix if it is not already installed.
3. Install Homebrew if it is not already installed.
4. Install `nix-darwin` for macOS users.
5. Build the `bat` cache.

## Native package managers

- **macOS**: The script installs necessary packages using Homebrew.
- **Linux**: The script detects the distribution and installs the required packages using the appropriate package manager (APT for Debian-based, DNF for RHEL-based, and Yay for Arch-based).

Works best and tested with Arch-based distros.

To set up the environment, run the following command:

```sh
bash setup.sh
```

This script will:

1. Install Homebrew if it is not already installed.
2. Install `yay` for Arch-based distributions if it is not already installed.
3. Stow dotfiles for various applications and tools based on the detected operating system.

## Dotfiles Included

The dotfiles for the following program are included in this repository:

- `aerospace`
- `alacritty`
- `bash`
- `bat`
- `btop`
- `ghostty`
- `git`
- `hyprland`
- `i3`
- `kitty`
- `lazygit`
- `nvim`
- `picom`
- `polybar`
- `rofi`
- `skhd`
- `starship`
- `tmux`
- `waybar`
- `wezterm`
- `xremap`
- `yabai`
- `yazi`
- `zellij`
- `zsh`

## Usage

After the setup is complete, restart your terminal session to apply the changes. You can then customize your environment further by modifying the dotfiles as needed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
