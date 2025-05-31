
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mas
  ];

  home.activation.installMasApps = ''
    echo "Installing Mac App Store apps via mas..."
    mas install 497799835  # Xcode
  '';
}
