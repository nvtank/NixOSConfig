{ config, pkgs, ... }:

{
  # GNOME (nếu bạn đang dùng GNOME thì giữ)
  services.xserver.enable = true;
  # services.displayManager.gdm.enable = true;
  #services.desktopManager.gnome.enable = true;

  # Âm thanh (PipeWire)
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  hardware.pulseaudio.enable = false;

  # Bluetooth (nếu cần)
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Flatpak (nếu bạn hay cài app kiểu Discord/Spotify)
  services.flatpak.enable = true;

  # Firewall
  networking.firewall.enable = true;

  # Timezone + locale base (tùy bạn)
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
}
