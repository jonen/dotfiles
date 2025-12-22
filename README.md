# Jon's Dotfiles

## Overview

This repository contains my personal dotfiles, managed by [`chezmoi`](https://chezmoi.io). It sets up my macOS environment, installs applications and tools via Homebrew, and configures them.

## How It Works

- **`chezmoi`**: Manages the dotfiles, ensuring the correct files are in the correct locations.
- **Homebrew Bundle**: A `Brewfile.tmpl` template is used to define all Homebrew packages, casks, and Mac App Store apps. This allows for a single command to install everything.
- **Machine-Specific Configuration**: The setup can be tailored for "personal" or "work" machines. This is controlled by a `machine` variable in the `chezmoi` configuration, which conditionally installs different packages from the `Brewfile`.

## Prerequisites

- **Homebrew**: Required for installing packages.
- **`chezmoi`**: Can be installed via Homebrew: `brew install chezmoi`.

## Quick Start

1.  **Initialize `chezmoi` with this repository:**

    ```bash
    chezmoi init https://github.com/your-username/dotfiles.git
    ```
    *(Replace `your-username` with your actual GitHub username)*

2.  **Edit your configuration (optional):**

    `chezmoi` will create a configuration file at `~/.config/chezmoi/chezmoi.toml`. You can edit this file to set your machine type:

    ```toml
    # ~/.config/chezmoi/chezmoi.toml
    [data]
    machine = "personal" # or "work"
    ```

3.  **Apply the dotfiles and install packages:**

    Run `chezmoi apply`. This will:
    -   Create the dotfile symlinks in your home directory.
    -   Generate the `~/.Brewfile` from the template.
    -   Run the install script which executes `brew bundle` to install all your software.

## Common Commands

- **Pull and apply the latest changes from your repo:**
  ```bash
  chezmoi update
  ```
- **Edit a managed dotfile:**
  ```bash
  chezmoi edit ~/.zshrc
  ```
- **See what changes `chezmoi` would make:**
  ```bash
  chezmoi diff
  ```

