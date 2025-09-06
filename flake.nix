{
  description = "Jons Mac Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      darwinConfigurations."jons-Mac-mini" = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
          # Home Manager
          home-manager.darwinModules.home-manager
          {
            home-manager.users.jon = import ./home.nix;
            home-manager.backupFileExtension = "backup";
          }
        ];
        specialArgs = { inherit self; };
      };
    };
}
