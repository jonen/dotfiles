{
  enable = true;
  onActivation.autoUpdate = true;
  onActivation.upgrade = true;
  onActivation.cleanup = "zap";
  brews = [
    "gemini-cli"
    "kubectl"
    "libavif"
    "mas"
    "minikube"
    "opencode"
    "pkgconf"
    "podman"
    "podman-compose"
    "podman-tui"
    "python@3.11"
    "tailscale"
    "uv"
  ];
  casks = [
    "1password"
    "1password-cli"
    "brave-browser"
    "codex"
    # "discord" # Personal only - excluded from work
    "ghostty"
    "homerow"
    "obsidian"
    "ollama-app"
    # "plexamp" # Personal only - excluded from work
    "raycast"
    # "readest" # Personal only - excluded from work
    "tailscale-app"
    "visual-studio-code"
    "vlc"
    "xquartz"
  ];
  taps = [
  ];
  masApps = {
    _1PasswordforSafari = 1569813296;
    AdGuardforSafari = 1440147259;
    # BlackmagicDiskSpeedTest = 425264550; # Personal only - excluded from work
    # Compressor = 424390742; # Personal only - excluded from work
    Consent-O-Matic = 1606897889;
    Copilot = 6738511300;
    # FinalCutPro = 424389933; # Personal only - excluded from work
    # GarageBand = 682658836; # Personal only - excluded from work
    # Infuse = 1136220934; # Personal only - excluded from work
    keymapp = 6472865291;
    # LogicPro = 634148309; # Personal only - excluded from work
    MicrosoftExcel = 462058435;
    MicrosoftOneNote = 784801555;
    MicrosoftOutlook = 985367838;
    MicrosoftPowerPoint = 462062816;
    MicrosoftWord = 462054704;
    # Motion = 434290957; # Personal only - excluded from work
    NimbleCommander = 905202937;
    ObsidianWebClipper = 6720708363;
    OneDrive = 823766827;
    Photomator = 1444636541;
    PixelmatorPro = 1289583905;
    SponsorBlock = 1573461917;
    uBlockOriginLite = 6745342698;
    WindowsApp = 1295203466;
    Xcode = 497799835;
  };
}