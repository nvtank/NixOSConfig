{ lib, pkgs, ... }:

{
  # Dev features
  programs.git.enable = true;

  programs.starship.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.adb.enable = true;
  virtualisation.docker.enable = true;

  users.users.nvtank.extraGroups = lib.mkAfter [ "docker" "adbusers" ];

  environment.systemPackages = with pkgs; [
    android-studio
  ];
}
