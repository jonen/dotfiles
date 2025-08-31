{ config, pkgs, ... }:

{
  # Make sure Home Manager matches system state version
  home.stateVersion = "25.11"; # or latest you see on home-manager
  home.sessionPath = [
    "/opt/homebrew/bin"
  ];
  # Example: your per-user CLI packages
  home.packages = [
    pkgs.mas
  ];

  home.file = {
    ".bashrc" = {
      source = config.lib.file.mkOutOfStoreSymlink ../../../bash/dot-bashrc;
    };
  }
}
