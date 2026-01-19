{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    unzip
    zip
    jq
    ripgrep
    fd
    fzf
    htop
    btop
    tree
    
    # Dev
    nodejs_20
    python3
    gcc
    gnumake
    cmake

    # Java/Android
    jdk17
    android-studio
  ];

  # Git
  programs.git.enable = true;

  # Zsh + goodies
  programs.zsh.enable = true;
  programs.starship.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # ADB (Android)
  programs.adb.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Cho user dùng docker/adb
  users.users.nvtank.extraGroups = [ "wheel" "networkmanager" "docker" "adbusers" ];
}
