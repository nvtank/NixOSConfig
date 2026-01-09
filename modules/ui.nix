{ config, pkgs, ... }:

{
  # Desktop UI
  services.xserver.enable = true;

  # Login manager
  services.displayManager.sddm.enable = true;

  # KDE Plasma
  services.desktopManager.plasma6.enable = true;

  xdg.portal.enable = true;

  # Font + icon + cursor (system-wide, chọn trong KDE Settings)
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    bibata-cursors
  ];
}
