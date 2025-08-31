{ config, pkgs, ... }:

let
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  # Make sure Home Manager matches system state version
  home.stateVersion = "25.11"; # or latest you see on home-manager
  home.sessionPath = [
    "/opt/homebrew/bin"
  ];
  # Example: your per-user CLI packages
  home.packages = [
    pkgs.mas
  ];

  home.file = {
    ".bashrc".source = symlink ../../bash/dot-bashrc;
    ".config/lazygit".source = symlink ../../lazygit/dot-config/lazygit;
    ".config/yazi".source = symlink ../../yazi/dot-config/yazi;
    ".config/nvim".source = symlink ../../nvim/dot-config/nvim;
    ".config/kitty".source = symlink ../../kitty/dot-config/kitty;
    ".config/ghostty".source = symlink ../../ghostty/dot-config/ghostty;
    ".config/btop".source = symlink ../../btop/dot-config/btop;
    ".config/bat".source = symlink ../../bat/dot-config/bat;
    ".config/tmux/tmux.conf".source = symlink ../../tmux/dot-config/tmux/tmux.conf;
    ".inputrc".source = symlink ../../zsh/dot-inputrc;
    ".zprofile".source = symlink ../../zsh/dot-zprofile;
    ".gitconfig".source = symlink ../../git/dot-gitconfig;
    ".gitignore_global".source = symlink ../../git/dot-gitignore_global;
    ".zshrc".source = symlink ../../zsh/dot-zshrc;
    ".config/starship.toml".source = symlink ../../starship/dot-config/starship.toml;
    ".local/bin/oil-ssh.sh".source = symlink ../../scripts/dot-local/bin/oil-ssh.sh;
  };
}
