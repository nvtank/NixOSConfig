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

  # Cho phép cài package unfree như spotify, google-chrome, kiro, nvidia...
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # GPU NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;

    # Driver NVIDIA proprietary thường ổn định hơn cho desktop/gaming/dev
    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # GUI GNOME
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
  # ZSH + gợi ý lệnh + highlight command
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    interactiveShellInit = ''
      # Starship prompt
      if command -v starship >/dev/null 2>&1; then
        eval "$(starship init zsh)"
      fi

      # fzf keybindings & completion
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh

      # zoxide
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"

      # aliases
      alias ls="eza --icons"
      alias ll="eza -lah --icons"
      alias s='shutdown now'
      alias c='clear'
      alias cat="bat"
      alias re='reboot'
      alias ga='git add .'
      alias gcl='git clone'
      alias gpl ='git pull origin main'
      alias gc ='git checkout -b'
      alias gm ='git commit -m'
      alias gp ='git push origin'
    '';
  };

  # Hỗ trợ chạy một số binary Linux ngoài NixOS
  programs.nix-ld.enable = true;

  # services.mongodb = {
  #   enable = true;
  #   package = pkgs.mongodb-ce;
  # };

  # Packages
  environment.systemPackages = with pkgs; [
    # Browser / desktop apps
    firefox
    spotify
    zotero

    # Kiro AI IDE + CLI
    kiro

    # Basic tools
    wget
    curl
    appimage-run
    unzip
    gnumake
    gcc
    pkg-config

    # Terminal / CLI tools
    gemini-cli
    awscli2
    ssm-session-manager-plugin
    terraform

    # GNOME customization
    gnomeExtensions.user-themes
    gnome-tweaks
    sassc

    # Docker
    docker-compose

    # Dev libraries
    stdenv.cc.cc.lib
    zlib
    openssl

    # Database / backend tools
    postgresql
    mongosh
    supabase-cli

    # Mobile dev
    flutter
  ];

  system.stateVersion = "25.11";
}
