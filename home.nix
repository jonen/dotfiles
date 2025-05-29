{ config, pkgs, ... }:

{
  home.username = "jon";
  home.homeDirectory = "/home/jon"; # macOS users may change this to /Users/jon
  home.stateVersion = "23.11"; # or the version you're targeting

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
    wezterm kitty alacritty yazi zellij rofi i3 polybar
    xremap yabai skhd btop ghostty stow
  ];

  # Dotfiles
  home.file.".zshrc".source = ./zsh/.zshrc;
  home.file.".gitconfig".source = ./git/.gitconfig;
  home.file.".config/nvim" = { source = ./nvim; recursive = true; };
  home.file.".config/tmux" = { source = ./tmux; recursive = true; };
  home.file.".config/alacritty" = { source = ./alacritty; recursive = true; };
  home.file.".config/kitty" = { source = ./kitty; recursive = true; };
  home.file.".config/wezterm" = { source = ./wezterm; recursive = true; };
  home.file.".config/starship.toml".source = ./starship/starship.toml;

  # Optional: add the rest as needed (e.g., yabai, skhd, i3, polybar, etc.)
}

