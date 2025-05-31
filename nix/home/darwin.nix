
{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  homebrew = {
    enable = true;
    masApps = {
      "";
    }
    onActivation.cleanup = "zap";
  }
}
