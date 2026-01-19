{ pkgs, ... }:

{
  users.users.nvtank = {
    isNormalUser = true;
    description = "nvtank";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = true;
}
