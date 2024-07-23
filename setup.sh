#!/bin/bash

# Check if running on macOS or Arch Linux
if [[ "$(uname -s)" == "Darwin" ]]; then
    # macOS
    if [[ ! $(command -v brew) ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install git tmux neovim ripgrep fd poetry starship lazygit fzf zoxide eza stow font-meslo-lg-nerd-font bat yazi jq
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    bat cache --build
elif [[ "$(uname -s)" == "Linux" && "$(uname -r)" == *"arch"* ]]; then
    # Arch Linux
    sudo pacman -Syu git tmux neovim ripgrep fd poetry starship lazygit fzf zoxide zsh eza stow npm openmp llvm clang gcc lua luarocks make wget jq yazi npm cargo rust bat ttf-meslo-nerd
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    bat cache --build
else
    echo "Unsupported operating system."
    exit 1
fi

echo "Packages installed successfully."
