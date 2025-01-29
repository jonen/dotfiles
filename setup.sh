#!/bin/bash

# Check if running on macOS or Arch Linux
if [[ "$(uname -s)" == "Darwin" ]]; then
    # macOS
    if [[ ! $(command -v brew) ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install git tmux neovim ripgrep fd poetry starship lazygit fzf zoxide eza stow font-meslo-lg-nerd-font bat yazi jq git-delta
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    bat cache --build
elif [[ "$(uname -s)" == "Linux" && "$(uname -r)" == *"arch"* ]]; then
    # Arch Linux
    sudo pacman -Syu git tmux neovim ripgrep fd poetry starship lazygit fzf zoxide zsh eza stow npm openmp llvm clang gcc lua luarocks make wget jq yazi npm cargo rust bat ttf-meslo-nerd git-delta
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    bat cache --build
elif [[ "$(uname -s)" == "Linux" && "$(uname -r)" == *"el9"* ]]; then
    # RHEL9
    # add Repos
    # for fd
    sudo dnf copr enable tkbcopr/fd -y
    # starship
    sudo dnf copr enable atim/starship -y
    # lazygit
    sudo dnf copr enable atim/lazygit -y
    sudo dnf install -y git tmux neovim ripgrep fd python3 starship lazygit fzf zoxide zsh stow npm llvm clang gcc lua luarocks make wget jq npm cargo bat git-delta
    # rust and cargo
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup update
    # install eza
    cargo install eza
    # install yazi
    cargo install yazi-fm yazi-cli
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    bat cache --build
else
    echo "Unsupported operating system."
    exit 1
fi

echo "Packages installed successfully."
