
{ config, pkgs, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.jon = {
    isNormalUser = true;
    home = "/home/jon";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager.users.jon = import ../users/jon.nix;

  system.stateVersion = "25.05";
}
