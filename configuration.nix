{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/common.nix
    ./modules/base.nix
    ./modules/user.nix
    ./modules/vietnamese.nix

    ./modules/terminal.nix
    ./modules/shell.nix
    ./modules/ui.nix
    ./modules/desktop.nix

    ./modules/packages.nix
    ./modules/dev.nix
    ./modules/maintenance.nix
  ];

  networking.hostName = "nixos";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    zotero
    firefox
    antigravity
    unityhub
    vim
    wget
    gemini-cli
    curl
  ];

  system.stateVersion = "25.11";
}
