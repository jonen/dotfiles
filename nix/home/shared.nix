
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep fd uv zoxide eza jq delta rustc cargo nodejs glances
    kitty zellij btop gnupg fastfetch nerd-fonts.meslo-lg
    tailscale autoenv yazi
  ];

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

  home.stateVersion = "25.05";

  # Dotfiles
  home.file.".bashrc".source = ../../bash/dot-bashrc;
  home.file.".zshrc".source = ../../zsh/dot-zshrc;
  home.file.".inputrc".source = ../../zsh/dot-inputrc;
  home.file.".zprofile".source = ../../zsh/dot-zprofile;
  home.file.".gitconfig".source = ../../git/dot-gitconfig;
  home.file.".config/nvim" = { source = ../../nvim/dot-config/nvim; recursive = true; };
  home.file.".config/bat" = { source = ../../bat/dot-config/bat; recursive = true; };
  home.file.".config/btop" = { source = ../../btop/dot-config/btop; recursive = true; };
  home.file.".config/tmux" = { source = ../../tmux/dot-config/tmux; recursive = true; };
  home.file.".config/kitty" = { source = ../../kitty/dot-config/kitty; recursive = true; };
  home.file.".config/starship.toml".source = ../../starship/dot-config/starship.toml;
}
