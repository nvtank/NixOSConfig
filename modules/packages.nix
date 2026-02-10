{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vscode
    antigravity
    libreoffice-fresh
    git
    vim
    neovim
    wget
    curl
    htop
    tree
    unzip
    
     # Web
    nodejs_20
    pnpm

    # Python
    python3
    python3Packages.pip
    python3Packages.virtualenv

    # Java
    jdk17
    maven
    gradle

    # C/C++
    gcc
    gdb
    cmake
    ninja
    clang-tools

    # Go
    go
    gopls
    
    zip
    fastfetch
  ];

  environment.etc."xdg/applications/antigravity.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Antigravity
    Exec=antigravity
    Terminal=false
    Categories=Utility;
  '';  
}
