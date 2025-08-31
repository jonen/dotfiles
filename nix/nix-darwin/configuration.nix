{ pkgs, self, ... }:
{
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.primaryUser = "jon";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  # Install the following packages
  environment.systemPackages = import ./nix-packages.nix pkgs;
  homebrew = import ./homebrew-packages.nix;

  system.activationScripts.masApps.text = ''
    # Add more app IDs as needed
    mas install 462058435   # Microsoft Excel
    mas install 784801555   # Microsoft OneNote
    mas install 985367838   # Microsoft Outlook
    mas install 462062816   # Microsoft PowerPoint
    mas install 462054704   # Microsoft Word
  '';
}
