{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fzf
    zoxide
    eza
    bat
    fd
    ripgrep
    starship
    fzf zoxide eza bat fd ripgrep fastfetch
    fastfetch
  ];

  programs.command-not-found.enable = true;
}
