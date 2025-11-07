{ pkgs, self, ... }:
{
  imports = [
    ./configuration.nix
  ];

  # Homebrew and Mac App Store - Work profile
  homebrew = import ./brew-work.nix;
}