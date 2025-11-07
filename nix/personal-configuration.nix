{ pkgs, self, ... }:
{
  imports = [
    ./configuration.nix
  ];

  # Homebrew and Mac App Store - Personal profile (includes all packages)
  homebrew = import ./brew-personal.nix;
}