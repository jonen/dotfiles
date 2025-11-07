{ pkgs, self, ... }:
{
  imports = [
    ./configuration.nix
  ];

  # Homebrew and Mac App Store - Work profile (excludes personal packages)
  homebrew = import ./homebrew.nix;
}