{ inputs, lib, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  hyprlandPackage = inputs.hyprland.packages.${system}.hyprland;
  hyprlandPortal = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
in
{
  # Add Hyprland alongside the existing GNOME/GDM desktop so the known-good
  # session remains available while the new compositor is evaluated.
  programs.hyprland = {
    enable = true;
    package = hyprlandPackage;
    portalPackage = hyprlandPortal;
    withUWSM = false;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = lib.mkAfter [ hyprlandPortal pkgs.xdg-desktop-portal-gtk ];
    config.hyprland = {
      default = [ "hyprland" "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
  };

  security.pam.services.hyprlock = { };
  security.polkit.enable = true;
  environment.systemPackages = [ hyprlandPackage hyprlandPortal pkgs.hyprlock ];
}
