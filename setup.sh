#!/bin/bash

# Function to install Homebrew if not installed
install_homebrew() {
    if [[ ! $(command -v brew) ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

# Function to stow dotfiles
stow_dotfiles() {
    dotfiles_list=(
        aerospace alacritty bash bat btop ghostty git hyprland i3 kitty lazygit nvim picom 
        polybar rofi skhd starship tmux waybar wezterm xremap yabai yazi zellij zsh
    )
    echo "Stowing dotfiles..."
    for item in "${dotfiles_list[@]}"; do
        echo "Stowing: $item"
        stow --dotfiles "$item"
    done
    echo "Dotfiles stowed successfully."
}

# Detect the operating system
if [[ "$(uname -s)" == "Darwin" ]]; then
    echo "macOS detected."
    install_homebrew
    brew install git tmux neovim ripgrep fd uv starship lazygit fzf zoxide eza stow font-meslo-lg-nerd-font bat yazi jq git-delta
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    bat cache --build
    stow_dotfiles
elif [ -f /etc/os-release ]; then
    . /etc/os-release
    # Get distribution and install homebrew prerequisites
    case "$ID" in
        debian|ubuntu|linuxmint|pop)
            echo "Debian-based distribution detected: $NAME"
            sudo apt-get install -y build-essential procps curl file git zsh
           ;;
        rhel|centos|fedora|rocky|almalinux|oracle)
            echo "RHEL/Fedora-based distribution detected: $NAME"
            sudo dnf groupinstall -y 'Development Tools'
            sudo dnf install -y procps-ng curl file git zsh
           ;;
        arch|manjaro|endeavouros)
            echo "Arch-based distribution detected: $NAME"
            sudo pacman -S --noconfirm base-devel procps-ng curl file git zsh
           ;;
        *)
            echo "Unknown or unsupported distribution: $NAME"
            exit 1
            ;;
    esac
    
    install_homebrew
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    brew install git tmux neovim ripgrep fd uv starship lazygit fzf zoxide eza stow bat yazi jq git-delta rust
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    bat cache --build
    stow_dotfiles
else
    echo "Cannot determine operating system. /etc/os-release not found."
    exit 1
fi

echo "Packages installed successfully."

