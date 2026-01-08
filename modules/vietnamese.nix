{ config, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-bamboo
      qt6Packages.fcitx5-configtool
      # Nếu bạn cần gõ trong app Qt thì mở comment 2 dòng dưới:
      # libsForQt5.fcitx5-qt
      # qt6Packages.fcitx5-qt
    ];
  };
}

