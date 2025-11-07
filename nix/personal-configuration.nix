{ pkgs, self, ... }:
{
  imports = [
    ./configuration.nix
  ];

  # Homebrew and Mac App Store - Personal profile
  homebrew = import ./brew-personal.nix;
}