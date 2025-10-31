{ config, pkgs, ... }:
let
  dotfiles = "/Users/jon/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  # Make sure Home Manager matches system state version
  home = {
    username = "jon";
    homeDirectory = "/Users/jon"; 
    stateVersion = "24.05";
  };

  # Example: your per-user CLI packages
  home.packages = [
    pkgs.home-manager
  ];

  home.file = {
    ".config/lazygit".source = ./lazygit/dot-config/lazygit;
    ".config/yazi".source = ./yazi/dot-config/yazi;
    ".config/nvim".source = ./nvim/dot-config/nvim;
    ".config/kitty".source = ./kitty/dot-config/kitty;
    ".config/ghostty" = {
        source = create_symlink "${dotfiles}/ghostty/dot-config/ghostty";
        recursive = true;
    };
    ".config/btop".source = ./btop/dot-config/btop;
    ".config/bat".source = ./bat/dot-config/bat;
    ".bashrc".source = create_symlink "${dotfiles}/bash/dot-bashrc";
    ".config/tmux/tmux.conf"= {
        source = create_symlink "${dotfiles}/tmux/dot-config/tmux/tmux.conf";
    };
    ".inputrc".source = create_symlink "${dotfiles}/zsh/dot-inputrc";
    ".zprofile".source = create_symlink "${dotfiles}/zsh/dot-zprofile";
    ".gitconfig".source = create_symlink "${dotfiles}/git/dot-gitconfig";
    ".gitignore_global".source = create_symlink "${dotfiles}/git/dot-gitignore_global";
    ".zshrc".source = create_symlink "${dotfiles}/zsh/dot-zshrc";
    ".config/starship.toml".source = create_symlink "${dotfiles}/starship/dot-config/starship.toml";
    ".local/bin/oil-ssh.sh".source = create_symlink "${dotfiles}/scripts/dot-local/bin/oil-ssh.sh";
  };
}
