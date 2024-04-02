# Jon's dotfiles

## Prereqs

- bash
- oh-my-bash
    ```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    ```
- oh-my-zsh
    ```sh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
- tmux with tpm
    - https://github.com/tmux-plugins/tpm
    ```sh
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
- neovim
- ripgrep
- autoenv
    ```sh
    $ git clone 'https://github.com/hyperupcall/autoenv' ~/.autoenv
    ```
- fd
    ```sh
    brew install fd
    ```
- poetry
    ```sh
    curl -sSL https://install.python-poetry.org | POETRY_HOME=~/.local/share/pypoetry python3 -
    ``
- starship
    ```sh
    curl -fsSL https://starship.rs/install.sh | bash
    ```
- lazygit (fedora)
    ```sh
    sudo dnf copr enable atim/lazygit -y
    sudo dnf install lazygit -y
    ```


