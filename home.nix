{ config, pkgs, ... }:

let
  homeDir = if pkgs.stdenv.isDarwin then
    "/Users/jon"
  else
    "/home/jon";

in
{
  home.username = "jon";
  home.homeDirectory = homeDir;
  home.stateVersion = "25.05"; # or the version you're targeting

  programs.home-manager.enable = true;

  # Enable apps
  programs.zsh.enable = true;
  programs.git.enable = true;
  programs.tmux.enable = true;
  programs.neovim.enable = true;
  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.starship.enable = true;
  programs.lazygit.enable = true;

  home.packages = with pkgs; [
    ripgrep fd uv zoxide eza jq delta rustc cargo nodejs
    kitty yazi zellij btop gnupg fastfetch
  ];

  # Dotfiles
  home.file.".zshrc".source = ./zsh/dot-zshrc;
  home.file.".inputrc".source = ./zsh/dot-inputrc;
  home.file.".zprofile".source = ./zsh/dot-zprofile;
  home.file.".gitconfig".source = ./git/dot-gitconfig;
  home.file.".config/nvim" = { source = ./nvim/dot-config/nvim; recursive = true; };
  home.file.".config/tmux" = { source = ./tmux/dot-config/tmux; recursive = true; };
  home.file.".config/kitty" = { source = ./kitty/dot-config/kitty; recursive = true; };
  home.file.".config/starship.toml".source = ./starship/dot-config/starship.toml;
}

