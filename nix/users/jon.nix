
{ config, pkgs, ... }:

{
  home.username = "jon";
  home.homeDirectory = "/Users/jon";
	
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.home-manager
  ];

  home.file.".zshrc".source = ../../zsh/dot-zshrc;
}
