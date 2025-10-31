# Dotfiles Project Overview

This repository contains a comprehensive set of dotfiles and configurations for a development environment, primarily targeting macOS and Linux systems. It uses a combination of Nix, Home Manager, and shell scripts to automate the setup and management of tools and applications.

## Key Technologies and Tools

*   **Nix:** Used for declarative package management and system configuration, primarily on macOS through `nix-darwin`.
*   **Home Manager:** Manages user-level packages and dotfiles in a declarative way.
*   **Shell Scripts:** Provides a more traditional, imperative setup for both macOS and various Linux distributions.
*   **Stow:** A symlink farm manager used by the shell script-based setup to manage dotfiles.
*   **Nerd Fonts:** The setup relies on Nerd Fonts for proper rendering of icons and symbols in the terminal.

## Project Structure

The repository is organized by application, with each directory containing the corresponding configuration files. For example:

*   `nvim/`: Neovim configuration in Lua.
*   `zsh/`: Zsh shell configuration (`.zshrc`, `.zprofile`).
*   `tmux/`: Tmux configuration.
*   `alacritty/`, `kitty/`, `ghostty/`: Terminal emulator configurations.

## Setup and Installation

There are two primary methods for setting up a new machine with these dotfiles:

### 1. Nix-based Setup (macOS)

This is the recommended approach for macOS. It leverages `nix-darwin` and `home-manager` for a declarative and reproducible setup.

**To run the Nix-based setup:**

```bash
./setup-mac.sh
```

This script will:

1.  Install Nix and Homebrew if they are not already present.
2.  Prompt for the specific machine configuration to apply (e.g., "Jons-MacBook-Pro").
3.  Apply the system-level configuration using `nix-darwin`.
4.  Apply the user-level configuration using `home-manager`.

### 2. Script-based Setup (Linux & macOS)

This method uses a shell script to install packages via native package managers (`apt`, `dnf`, `yay`, `brew`) and then uses `stow` to create symlinks to the dotfiles.

**To run the script-based setup:**

```bash
./setup.sh
```

This script will:

1.  Detect the operating system and distribution.
2.  Install necessary packages using the appropriate package manager.
3.  Use `stow` to symlink the dotfiles into the home directory.

## Development Conventions

*   **Modularity:** Configurations are kept in separate files for each application.
*   **Declarative (Nix):** The Nix-based setup favors a declarative approach, specifying the desired state of the system and letting Nix handle the details.
*   **Scripted (Shell):** The shell-based setup is more imperative, with explicit installation and linking steps.
*   **Secrets:** No secrets should be stored in this repository. Use a separate mechanism for managing sensitive information.
