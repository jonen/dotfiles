# Jon's dotfiles

## Prereqs

- homebrew (macOS)
    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
- oh-my-bash (fedora)
    ```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    ```
- oh-my-zsh (macOS)
    ```sh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
- tmux
    - macOS
    ```sh
    brew install tmux
    ```
    - fedora
    ```sh
    sudo dnf install tmux
    ```
- tmux with tpm
    ```sh
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
- neovim
    - macOS
    ```sh
    brew install neovim
    ```
    - fedora
    ```sh
    sudo dnf install neovim
    ```
- ripgrep
    - macOS
    ```sh
    brew install ripgrep
    ```
    - fedora
    ```sh
    sudo dnf install ripgrep
    ```
- autoenv
    ```sh
    $ git clone 'https://github.com/hyperupcall/autoenv' ~/.autoenv
    ```
- fd 
    - macOS
    ```sh
    brew install fd
    ```
    - fedora
    ```sh
    sudo dnf install fd-find
    ```
- poetry
    ```sh
    curl -sSL https://install.python-poetry.org | POETRY_HOME=~/.local/share/pypoetry python3 -
    ```
- starship
    ```sh
    curl -fsSL https://starship.rs/install.sh | sh
    ```
- lazygit 
    - macOS
    ```sh
    brew install lazygit
    ```
    - fedora
    ```sh
    sudo dnf copr enable atim/lazygit -y
    sudo dnf install lazygit -y
    ```

