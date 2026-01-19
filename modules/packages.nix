{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
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
    nodejs_22
    pnpm

    # Python
    python3
    python3Packages.pip
    python3Packages.virtualenv

    # Java
    jdk21
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
      (pkgs.writeShellScriptBin "antigravity" ''
      exec /home/nvtank/year3/gooogle/Antigravity/antigravity "$@"
    '')
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
