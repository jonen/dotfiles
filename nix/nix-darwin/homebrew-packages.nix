{
  enable = true;
  onActivation.autoUpdate = true;
  brews = [
  ];
  casks = [
    "vlc"
    "witsy"
    "shortcat"
    "raycast"
    "ghostty"
    "1password-cli"
    "mas"
  ];
  taps = [
  ];

  system.activationScripts.masApps.text = ''
    # Add more app IDs as needed
  '';
}
