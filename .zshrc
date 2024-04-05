export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export ZSH=$HOME/.oh-my-zsh

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(rust brew git gitfast macos extract cp vi-mode history-substring-search tmux poetry) 

source $ZSH/oh-my-zsh.sh


alias vim=nvim
export EDITOR=nvim
export VISUAL=nvim

export REPORTTIME=5

lsd_installed=$(which lsd)
if [ -x "$lsd_installed" ] ; then
  alias ls=lsd
fi
alias ll='ls -lah'
alias l='ls -lh'
alias lsa='ls -lah'
alias la='ls -lA'

alias scpresume="rsync --partial --progress --rsh=ssh --human-readable"
alias rcopy="rsync --partial --progress --append --rsh=ssh --recursive --human-readable"
alias rmove="rsync --partial --progress --append --rsh=ssh --recursive --human-readable --remove-source-files"

alias sudoedit="sudo -e"

alias c=clear
alias lg=lazygit

function most_useless_use_of_zsh {
   local lines columns colour a b p q i pnew
   ((columns=COLUMNS-1, lines=LINES-1, colour=0))
   for ((b=-1.5; b<=1.5; b+=3.0/lines)) do
       for ((a=-2.0; a<=1; a+=3.0/columns)) do
           for ((p=0.0, q=0.0, i=0; p*p+q*q < 4 && i < 32; i++)) do
               ((pnew=p*p-q*q+a, q=2*p*q+b, p=pnew))
           done
           ((colour=(i/4)%8))
            echo -n "\\e[4${colour}m "
        done
        echo
    done
}

export XDG_CONFIG_HOME=~/.config

# Reset colors
#unset LSCOLORS
#export CLICOLOR=1
#export CLICOLOR_FORCE=1

# set homebrew env on macOS
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# activate fzf fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:~/.local/bin:/usr/local/bin:~/.fzf/bin:/usr/local/share/dotnet:~/.dotnet/tools:~/.config/tmux/plugins/tmuxifier/bin

[ -f ~/.config/tmux/plugins/tmuxifier/bin/tmuxifier ] && eval "$(tmuxifier init -)"
alias tmi=tmuxifier

[ -f ~/.autoenv/activate.sh ] && source ~/.autoenv/activate.sh
[ -f /opt/homebrew/opt/autoenv/activate.sh ] && source '/opt/homebrew/opt/autoenv/activate.sh'

export PATH="/Users/jon/.local/share/pypoetry/bin:$PATH"
export POETRY_VIRTUALENVS_IN_PROJECT=1
export POETRY_VIRTUALENVS_PROMPT={project_name}-py{python_version}

# Znap package manager
[ -f ~/.config/zsh-plugins/zsh-snap/znap.zsh ] && source ~/.config/zsh-plugins/zsh-snap/znap.zsh
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source memark/zsh-dotnet-completion

zstyle ':autocomplete:*' delay 0.1

# disable god-awful zsh autocomplete multi-line history
 bindkey '\e[A' history-beginning-search-backward
 bindkey '\eOA' history-beginning-search-backward
 bindkey '\e[B' history-beginning-search-forward
 bindkey '\eOB' history-beginning-search-forward
# zle -A {.,}history-incremental-search-forward
# zle -A {.,}history-incremental-search-backward


bindkey '^Y' autosuggest-accept
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete

# Rust
[ -f ~/.cargo/env ] && . "$HOME/.cargo/env"

eval "$(starship init zsh)"
