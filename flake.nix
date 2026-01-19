{
  description = "My NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
	 ./hardware-configuration.nix
         ./configuration.nix
	 ./modules/terminal.nix
	 ./modules/ui.nix
         ./modules/desktop.nix
         ./modules/shell.nix
      ];
    };
  };
}

