{ config, pkgs, ... }:

{
  # server
  services.xserver.enable = true;

  # GNOME + GDM
  services.displayManager.gdm.enable = true;

  services.desktopManager.gnome.enable = true;
  
 # environment.systemPackages = with pkgs; [
    #gnome-session 
    #gnome-shell
    #gnome-control-center
   # nautilus  
  #];

  # GNOME 
  programs.dconf.enable = true;

  # Âm thanh (PipeWire)
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  hardware.pulseaudio.enable = false;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Flatpak
  services.flatpak.enable = true;
 
  # Firewall
  networking.firewall.enable = true;

  # Timezone + locale base
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
}
