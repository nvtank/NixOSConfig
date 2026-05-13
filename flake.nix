{
  description = "My NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    antigravity.url = "github:jacopone/antigravity-nix";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, antigravity, ... }@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        unstablePkgs = import nixpkgs-unstable { inherit system; };
      };
      modules = [
        ./configuration.nix
      ];
    };
  };
}