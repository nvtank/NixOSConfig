{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    neovim
    wget
    curl
    htop
    tree
    unzip
    zip
    fastfetch
  ];
}
