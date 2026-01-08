{ ... }:

{
  users.users.nvtank = {
    isNormalUser = true;
    description = "nvtank";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  security.sudo.wheelNeedsPassword = true;
}
