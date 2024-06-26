#!/bin/bash

# Check if running on macOS or Arch Linux
if [[ "$(uname -s)" == "Darwin" ]]; then
    # macOS
    brew install git tmux neovim ripgrep fd poetry starship lazygit fzf zoxide eza stow
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
elif [[ "$(uname -s)" == "Linux" && "$(uname -r)" == *"arch"* ]]; then
    # Arch Linux
    sudo pacman -Syu git tmux neovim ripgrep fd poetry starship lazygit fzf zoxide zsh eza stow npm openmp llvm clang gcc lua luarocks make wget npm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "Unsupported operating system."
    exit 1
fi

echo "Packages installed successfully."
