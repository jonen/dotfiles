{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep fd uv zoxide eza jq delta rustc cargo nodejs glances
    zellij btop gnupg fastfetch nerd-fonts.meslo-lg
    autoenv yazi
  ];

  fonts.fontconfig.enable = true;

  # Enable apps
  programs.git.enable = true;
  programs.tmux.enable = true;
  programs.neovim.enable = true;
  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.starship.enable = true;
  programs.lazygit.enable = true;

  home.stateVersion = "25.05";

  # Dotfiles
  home.file.".bashrc" = { source = ../../bash/dot-bashrc; force = true; };
  home.file.".zshrc" = { source = ../../zsh/dot-zshrc; force = true; };
  home.file.".inputrc" = { source = ../../zsh/dot-inputrc; force = true; };
  home.file.".zprofile" = { source = ../../zsh/dot-zprofile; force = true ;};
  home.file.".gitconfig" = { source = ../../git/dot-gitconfig; force = true ;};
  home.file.".config/nvim" = { source = ../../nvim/dot-config/nvim; recursive = true; };
  home.file.".config/bat" = { source = ../../bat/dot-config/bat; recursive = true; };
  home.file.".config/btop" = { source = ../../btop/dot-config/btop; recursive = true; };
  home.file.".config/tmux" = { source = ../../tmux/dot-config/tmux; recursive = true; };
  home.file.".config/kitty" = { source = ../../kitty/dot-config/kitty; recursive = true; };
  home.file.".config/starship.toml".source = ../../starship/dot-config/starship.toml;
}
