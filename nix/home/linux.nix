
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh python3
  ];
}
