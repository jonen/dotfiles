{ config, pkgs, ... }:
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
    ".bashrc".source = ./bash/dot-bashrc;
    ".config/lazygit".source = ./lazygit/dot-config/lazygit;
    ".config/yazi".source = ./yazi/dot-config/yazi;
    ".config/nvim".source = ./nvim/dot-config/nvim;
    ".config/kitty".source = ./kitty/dot-config/kitty;
    ".config/ghostty".source = ./ghostty/dot-config/ghostty;
    ".config/btop".source = ./btop/dot-config/btop;
    ".config/bat".source = ./bat/dot-config/bat;
    ".config/tmux/tmux.conf".source = ./tmux/dot-config/tmux/tmux.conf;
    ".inputrc".source = ./zsh/dot-inputrc;
    ".zprofile".source = ./zsh/dot-zprofile;
    ".gitconfig".source = ./git/dot-gitconfig;
    ".gitignore_global".source = ./git/dot-gitignore_global;
    ".zshrc".source = ./zsh/dot-zshrc;
    ".config/starship.toml".source = ./starship/dot-config/starship.toml;
    ".local/bin/oil-ssh.sh".source = ./scripts/dot-local/bin/oil-ssh.sh;
  };
}
