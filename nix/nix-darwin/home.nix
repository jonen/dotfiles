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

  # Example: Add your mas automation here (as discussed above)
  home.activation.masApps = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    mas install 462058435   # Microsoft Excel
    mas install 784801555   # Microsoft OneNote
    mas install 985367838   # Microsoft Outlook
    mas install 462062816   # Microsoft PowerPoint
    mas install 462054704   # Microsoft Word
  '';
}
