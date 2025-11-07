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
        specialArgs = { inherit inputs self; };
        modules = [
          ./configuration.nix
        ];
      };
      darwinConfigurations."Jons-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs self; };
        modules = [
          ./configuration.nix
        ];
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
