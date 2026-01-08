{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/base.nix
    ./modules/packages.nix
    ./modules/user.nix
    ./modules/vietnamese.nix
    ./modules/dev.nix
  ];

  networking.hostName = "nixos";

  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  users.users.nvtank = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    firefox
    git
    vim
    wget
    curl
  ];

  system.stateVersion = "25.11";
}
