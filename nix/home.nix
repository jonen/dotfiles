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
  home.packages = with pkgs; [
    home-manager
  ];

  home.file = {
    ".config/lazygit" = {
        source = create_symlink "${dotfiles}/lazygit/dot-config/lazygit";
        recursive = true;
    };
    ".config/yazi" = {
        source = create_symlink "${dotfiles}/yazi/dot-config/yazi";
        recursive = true;
    };
    ".config/nvim" = {
      source = create_symlink "${dotfiles}/nvim/dot-config/nvim";
      recursive = true;

    };
    ".config/kitty" = {
        source = create_symlink "${dotfiles}/kitty/dot-config/kitty";
        recursive = true;
    };
    ".config/ghostty" = {
        source = create_symlink "${dotfiles}/ghostty/dot-config/ghostty";
        recursive = true;
    };
    ".config/btop" = {
        source = create_symlink "${dotfiles}/btop/dot-config/btop";
        recursive = true;
    };
    ".config/bat" = {
        source = create_symlink "${dotfiles}/bat/dot-config/bat";
        recursive = true;
    };
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
