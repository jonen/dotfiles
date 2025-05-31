{ config, pkgs, lib, home-manager, ... }:

{
  imports = [
    home-manager.darwinModules.home-manager
  ];

  users.users.jon.home = "/Users/jon";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.enable = true;

  programs.zsh.enable = true;

  home-manager.users.jon = import ../users/jon.nix;

  ids.gids.nixbld = 350;
  system.stateVersion = 4;
}

