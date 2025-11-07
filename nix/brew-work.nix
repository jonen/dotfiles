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
    "ghostty"
    "homerow"
    "obsidian"
    "ollama-app"
    "raycast"
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
    Consent-O-Matic = 1606897889;
    Copilot = 6738511300;
    keymapp = 6472865291;
    MicrosoftExcel = 462058435;
    MicrosoftOneNote = 784801555;
    MicrosoftOutlook = 985367838;
    MicrosoftPowerPoint = 462062816;
    MicrosoftWord = 462054704;
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