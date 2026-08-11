{
  description = "My NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    antigravity.url = "github:jacopone/antigravity-nix";

    # Pinned desktop stack for the optional end4 Hyprland session.  Keeping
    # these separate from nixpkgs lets GNOME remain on the stable system set.
    hyprland.url = "github:hyprwm/Hyprland/v0.55.0";
    quickshell = {
      # Includes the PipeWire default-sink lifetime fix from quickshell#568.
      url = "github:quickshell-mirror/quickshell/13fe9b0d98028361344b7422b1ebe238d1d29d02";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    illogical-impulse = {
      url = "github:end-4/dots-hyprland/aed4d1ec63f584905c28d2a678db5845579fdafc";
      flake = false;
    };
    end4-pc = {
      url = "github:pctrade/end4-pC/747bcfd01bba058f2ec434cb589f908b49a5dc85";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, antigravity, ... }@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        unstablePkgs = import nixpkgs-unstable {
           inherit system;
           config.allowUnfree = true;
        };
      };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
