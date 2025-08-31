{
  description = "Jons Mac Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
    }:
    {
      darwinConfigurations."jons-Mac-mini" = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
        ];
        specialArgs = { inherit self; };
      };
    };
}
