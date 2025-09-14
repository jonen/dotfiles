{
  description = "Jons Mac Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
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
        ];
        specialArgs = { inherit self; hostPlatform = "aarch64-darwin";};
      };
      darwinConfigurations."Jons-Intel-MacBook" = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
       ];
        specialArgs = { inherit self; hostPlatform = "x86_64-darwin";};
      };
      homeConfigurations."arm-jon" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        extraSpecialArgs = { inherit inputs; };
        configuration = import ./home.nix;
      };
      homeConfigurations."intel-jon" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-darwin"; };
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home.nix
        ];
      };
    };
}
