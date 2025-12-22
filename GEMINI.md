# Dotfiles Project Overview

This repository contains a comprehensive set of dotfiles and configurations for a development environment, managed by `chezmoi`. It is primarily designed for macOS.

## Key Technologies and Tools

*   **`chezmoi`**: The primary tool for managing dotfiles. It handles placing files in their correct locations and applying machine-specific configurations.
*   **Homebrew**: Used for all package management, including CLI tools and GUI applications.
*   **Homebrew Bundle**: A templated `Brewfile.tmpl` is used to declaratively manage all Homebrew packages.
*   **Go Templating**: `chezmoi` uses Go templates to enable machine-specific configurations, such as installing different packages for "personal" and "work" machines.

## Project Structure

The repository contains the dotfiles for various applications, which are managed by `chezmoi`. Key files include:

*   `~/.local/share/chezmoi/`: The `chezmoi` source directory where all dotfiles are stored. This is the main repository that `chezmoi` manages.
*   `Brewfile.tmpl`: A template for the Homebrew `Brewfile`, allowing for conditional package installation.
*   `.chezmoi.toml`: A configuration file placed in the `chezmoi` source directory to provide data (like machine type) to templates.
*   `run_onchange_install-brew-packages.sh.tmpl`: A script that `chezmoi` runs to execute `brew bundle`, installing and updating packages.

The dotfiles for each application (e.g., `nvim`, `zsh`, `tmux`) are stored within the `chezmoi` source directory in a structure that maps to the user's home directory.

## Setup and Installation

The setup is now managed entirely by `chezmoi`.

**Prerequisites:**
*   Homebrew
*   `chezmoi` (`brew install chezmoi`)

**To set up a new machine:**

1.  **Initialize `chezmoi`:**
    ```bash
    chezmoi init https://github.com/your-username/dotfiles.git
    ```
    *(Replace with the correct repository URL)*

2.  **Configure machine type (optional):**
    Edit the `~/.config/chezmoi/chezmoi.toml` file to set the machine type, e.g., `machine = "personal"`.

3.  **Apply everything:**
    ```bash
    chezmoi apply
    ```
    This command will:
    -   Create symlinks for all dotfiles.
    -   Generate `~/.Brewfile` based on the machine type.
    -   Run the Homebrew bundle script to install all software.

## Development Conventions

*   **Declarative `chezmoi`**: The setup is declarative. The state of the dotfiles is defined in the `chezmoi` source directory.
*   **Templating**: Machine-specific differences are handled through `chezmoi`'s templating system.
*   **Package Management**: All packages are managed through the `Brewfile.tmpl`. To add a new package, add it to this file and run `chezmoi apply`.
*   **Secrets**: No secrets should be stored in this repository. Use `chezmoi`'s integration with a password manager (like 1Password or Bitwarden) for managing secrets.
