{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    kitty-themes
  ];

  environment.etc."xdg/kitty/kitty.conf".text = ''
    font_family JetBrainsMono Nerd Font
    font_size 12.0
    background_opacity 0.92
    confirm_os_window_close 0
    enable_audio_bell no
    cursor_shape beam
  '';
}
