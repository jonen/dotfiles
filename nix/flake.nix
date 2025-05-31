{
  description = "Modular Nix config for macOS and Linux (x86_64 and aarch64)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    in {
      homeConfigurations = builtins.listToAttrs (builtins.concatLists (builtins.map (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in [
          {
            name = "jon-${system}";
            value = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [
                ./home/shared.nix
                ./home/${if pkgs.stdenv.isDarwin then "darwin.nix" else "linux.nix"}
                ./users/jon.nix
              ];
            };
          }
        ]
      ) systems));

      darwinConfigurations = builtins.listToAttrs (builtins.concatLists (builtins.map (system:
        if nixpkgs.lib.hasSuffix "darwin" system then [
          {
            name = "jon-${system}";
            value = darwin.lib.darwinSystem {
              inherit system;
              modules = [
                ./hosts/darwin.nix
                home-manager.darwinModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.users.jon = import ./users/jon.nix;
                }
              ];
              specialArgs = { inherit home-manager; };
            };
          }
        ] else []
      ) systems));

      nixosConfigurations = builtins.listToAttrs (builtins.concatLists (builtins.map (system:
        if nixpkgs.lib.hasSuffix "linux" system then [
          {
            name = "jon-${system}";
            value = nixpkgs.lib.nixosSystem {
              inherit system;
              modules = [
                ./hosts/linux.nix
                home-manager.nixosModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.users.jon = import ./users/jon.nix;
                }
              ];
              specialArgs = { inherit home-manager; };
            };
          }
        ] else []
      ) systems));
    };
}

