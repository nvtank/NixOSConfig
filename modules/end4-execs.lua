-- Hyprland does not process the XDG autostart entry used by GNOME.
-- Start the existing NixOS fcitx5-with-addons service only in this session.
hl.on("hyprland.start", function ()
    hl.exec_cmd("systemctl --user start fcitx5-daemon.service")
end)
