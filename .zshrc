export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR=nvim
export VISUAL=nvim
export XDG_CONFIG_HOME=~/.config
export PATH=$PATH:~/.local/bin:/usr/local/bin:/usr/local/share/dotnet:~/.dotnet/tools:~/.config/tmux/plugins/tmuxifier/bin
export TERM=xterm-256color

# Enable homebrew on macOS
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if not installed already
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

eval "$(starship init zsh)"

# Load plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light MenkeTechnologies/zsh-cargo-completion

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::brew
zinit snippet OMZP::cp

# Add in completions
# poetry
if [ ! -f ~/.zfunc/_poetry ]; then
  mkdir -p ~/.zfunc
  poetry completions zsh > ~/.zfunc/_poetry
fi
fpath+=~/.zfunc
fpath+=/opt/homebrew/share/zsh/site-functions

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -v
bindkey '^y' autosuggest-accept
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
lsd_installed=$(which lsd)
if [ -x "$lsd_installed" ] ; then
  alias ls="lsd --git"
fi
alias ll='ls -lah'
alias lt='ls -lah --tree'
alias l='ls -lh'
alias lsa='ls -lah'
alias la='ls -lA'

alias ..='cd ..'
alias ...='cd ../..'

alias scpresume="rsync --partial --progress --rsh=ssh --human-readable"
alias rcopy="rsync --partial --progress --append --rsh=ssh --recursive --human-readable"
alias rmove="rsync --partial --progress --append --rsh=ssh --recursive --human-readable --remove-source-files"

alias vim=nvim
alias v=nvim

alias sudoedit="sudo -e"

alias c=clear
alias lg=lazygit
alias y=yazi

[ -f ~/.config/tmux/plugins/tmuxifier/bin/tmuxifier ] && eval "$(tmuxifier init -)"
alias tmi=tmuxifier

# Shell integrations
# fzf
eval "$(fzf --zsh)"
# catppuccin for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# pypoetry
export PATH="~/.local/share/pypoetry/bin:$PATH"
export POETRY_VIRTUALENVS_IN_PROJECT=1
export POETRY_VIRTUALENVS_PROMPT={project_name}-py{python_version}

# Rust
[ -f ~/.cargo/env ] && . "$HOME/.cargo/env"

# autoenv
#[ -f ~/.autoenv/activate.sh ] && source ~/.autoenv/activate.sh
#[ -f /opt/homebrew/opt/autoenv/activate.sh ] && source '/opt/homebrew/opt/autoenv/activate.sh'
#export AUTOENV_ENABLE_LEAVE="true"

