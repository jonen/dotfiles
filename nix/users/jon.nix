
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
	
  home.stateVersion = "25.05";

  home.packages = [
#    pkgs.home-manager
  ];

  home.file.".zshrc".source = ../../zsh/dot-zshrc;
}
