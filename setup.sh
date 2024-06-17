#!/bin/bash

# Check if running on macOS or Arch Linux
if [[ "$(uname -s)" == "Darwin" ]]; then
    # macOS
    brew install git tmux neovim ripgrep fd poetry starship lazygit fzf zoxide
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
elif [[ "$(uname -s)" == "Linux" && "$(uname -r)" ~= "arch" ]]; then
    # Arch Linux
    sudo pacman -S git tmux neovim ripgrep fd poetry starship lazygit fzf zoxide zsh
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "Unsupported operating system."
    exit 1
fi

echo "Packages installed successfully."
