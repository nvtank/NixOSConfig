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
  

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #GPU
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;

    open = false; # thường ổn định hơn

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # GUI (GNOME)
  services.xserver.enable = true;

  services.desktopManager.gnome = {
    enable = true;
    extraGSettingsOverrides = ''
    '';
  };

  services.gnome.gnome-keyring.enable = true;

  # Docker
  virtualisation.docker.enable = true;
  users.users.nvtank.extraGroups = [ "docker" ];

  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.nix-ld.enable = true;
  
  # services.mongodb = {
  #   enable = true;
  #   package = pkgs.mongodb-ce;
  # };  
  
  # Packages
  environment.systemPackages = with pkgs; [
    zotero
    firefox
    unityhub
    vim
    spotify
    wget
    gemini-cli
    appimage-run
    gnomeExtensions.user-themes
    docker-compose
    gnome-tweaks
    curl
    sassc
    kiro
    mongodb-tools
    stdenv.cc.cc.lib
    zlib
    openssl
    gnumake
    gcc
    postgresql
    flutter
    rustdesk
    figma-linux
    pkg-config
    supabase-cli
    krita
    mongosh
    google-chrome
  ];

  system.stateVersion = "25.11";
}
