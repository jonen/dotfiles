{
  description = "Jons Mac Flake";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
      nix-darwin.url = "github:LnL7/nix-darwin"; # main branch tracks unstable nixpkgs well
      nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
      home-manager.url = "github:nix-community/home-manager"; # default branch = master (unstable)
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
      darwinConfigurations."Jons-Work-MacBook" = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
        ];
        specialArgs = {
          inherit self;
          hostPlatform = "aarch64-darwin";
        };
      };
      darwinConfigurations."Jons-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
        ];
        specialArgs = {
          inherit self;
          hostPlatform = "aarch64-darwin";
        };
      };
      homeConfigurations."jon" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home.nix
        ];
      };
    };
}
