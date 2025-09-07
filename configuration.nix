{ pkgs, self, hostPlatform, ... }:
{

  # Auto upgrade nix package and the daemon service.
  nix = {
    package = pkgs.nix;
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.primaryUser = "jon";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = hostPlatform;
  nixpkgs.config.allowUnfree = true;

  # Necessary for home manager
  users.users.jon = {
    home = "/Users/jon";
    shell = pkgs.zsh;
  };

  # Install the following packages
  # Nix packages
  environment.systemPackages = import ./nix-packages.nix pkgs;
  # Homebrew and Mac App Store
  homebrew = import ./homebrew-packages.nix;
  # Install fonts
  fonts.packages = import ./fonts-packages.nix pkgs;
}
